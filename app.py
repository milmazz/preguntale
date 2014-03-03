# -*- coding: utf-8 -*-

import os
import os.path
import json
from bson import json_util

from bottle import (Bottle, run, request, static_file, abort,
                    response, jinja2_template as template)
from pymongo import MongoClient

app = Bottle()
client = MongoClient("mongodb://localhost:27017/")
db = client.preguntale


@app.route("/", name="index")
def index():
    return template("index")


@app.route("/question", name="question")
def question():
    return template("question")


@app.route("/stats/major", name="stats-major")
def stats_major():
    return template("stats-major")


@app.route("/stats", name="stats")
def stats():
    return template("stats")


@app.route("/people", name="people")
def people():
    return template("people")


@app.route("/assets/<filepath:path>")
def assets(filepath):
    return static_file(filepath,
                       root=os.path.join(os.path.dirname(__file__), "assets"))


# Initial API
@app.route("/api/v1/questions")
def get_questions():
    """
    Get the details about the lasts questions by default.

    :param question_ids: The list of questions (listed as a comma separated
    string) that will be returned.
    :type questions_id: str or None
    :param fields: The fields that will be returned for every question if
    applies. This parameter should be formed as a comma separated string with
    the field names. Otherwise all the available fields should be returned.
    :type fields: str or None
    :param limit: The maximum number of questions objects that will be returned
    by request, no more than 100.
    :type limit: int or None
    :param offset: The offset by limit questions. Otherwise, returns the first
    page of questions.
    :type offset: int or None
    :param sort: The order by which the questions will be returned based on the
    date and time the question was created, published_asc or published_desc.
    Otherwise, returns questions in the descending order in which they were
    created.
    :type sort: str or None
    :param to: The ID of the person who's acting as a receiver of a question.
    :type to: int or None
    :param from: The ID of the person who's acting as sender of a question.
    :type from: int or None

    """
    response.content_type = "application/json"
    questions = db.questions.find()
    results = [doc for doc in questions]
    if not results:
        abort(404, "No data")

    return json.dumps(results, default=json_util.default)


@app.route("/api/v1/questions/:question_id")
def get_question(question_id):
    """Get the details about a question based on the ID.

    :param question_id: ID of the question
    :type question_id: int
    :param fields: The fields that will be returned in the response. This
    parameter should be formed as a comma separated string with the field
    names. Otherwise, all the available fields will be returned.
    :type fields: str or None

    :returns: Information about a particular question
    :rtype: JSON

    """
    fields = request.query.fields.split(",")
    try:
        question_id = int(question_id)
    except ValueError:
        abort(400, "Bad request, invalid ID: '%s'" % question_id)

    if fields:
        # TODO: Validate field names.
        result = db.questions.find_one({"_id": question_id}, fields=fields)
    else:
        result = db.questions.find_one({"_id": question_id})

    if not result:
        abort(404, "No question with the ID %s" % id)
    return result


@app.route("/api/v1/questions", method="POST")
def post_question():
    data = request.body.readline()
    if not data:
        abort(400, "No data received")
    entity = json.loads(data)
    if not entity.get("_id"):
        abort(400, "No _id specified")

    db.questions.insert(entity)


if __name__ == "__main__":
    run(app, host="0.0.0.0", port=int(os.environ.get("PORT", 5000)),
        debug=True)
