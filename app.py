# -*- coding: utf-8 -*-

import os
import os.path
import json
from bson import json_util

from bottle import Bottle, run, request, template, static_file, route, abort, response, jinja2_template as template
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
    response.content_type = "application/json"
    questions = db.questions.find()
    results = [doc for doc in questions]
    if not results:
        abort(404, "No data")

    return json.dumps(results, default=json_util.default)


@app.route("/api/v1/questions/:id")
def get_question(id):
    question = db.questions.find_one({"_id": 1})
    if not question:
        abort(404, "No question with id %s" % id)
    return question


@app.route("/api/v1/questions", method="POST")
def post_question():
    data = request.body.readline()
    print data
    if not data:
        abort(400, "No data received")
    entity = json.loads(data)
    if not entity.get("_id"):
        abort(400, "No _id specified")

    try:
        db.questions.insert(entity)
    except ValidationError as error:
        return error


if __name__ == "__main__":
    run(app, host="0.0.0.0", port=int(os.environ.get("PORT", 5000)),
        debug=True)
