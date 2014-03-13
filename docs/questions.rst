Questions
=========

 * :ref:`Get questions <get_questions>`
 * :ref:`Get a question by ID<get_question>`
 * :ref:`Get supporters of a question <get_supporters>`
 * :ref:`Create a question <post_question>`

.. note::

    * Add support for HATEOAS_
    * Show the available fields for every question

.. _HATEOAS: http://en.wikipedia.org/wiki/HATEOAS

.. _get_questions:

.. http:get:: /questions

    Get the details about the lasts questions by default.

    **Example request**:

    .. sourcecode:: http

        GET /questions?fields="question,tags"&limit=10&sort="desc"
        Host: example.com
        Accept: application/vnd.preguntale.v1+json

    **Example response:**

    .. sourcecode:: http

        HTTP/1.1 200 OK
        Content-Type: application/json

        [
            {
                "_id": 1234,
                "question": "Question 1",
                "tags": ["tag1", "tag2"]
            },
            {
                "_id": 1235,
                "question": "Question 2",
                "tags": ["tag1", "tag2"]
            }
        ]

    :query str question_ids: A list of comma separated question ids.
    :query str fields: A list of comma separated question fields. Otherwise all the available fields should be returned.
    :query int per_page: The maximum number of questions objects that will be returned by request, no more than 100.
    :query int page: The offset by `per_page` questions. Otherwise, returns the first page of questions.
    :query str sort: The order by which the questions will be returned based on the date and time the question was created, `asc` or `desc`. Default: `desc`.
    :query int to: The ID of the person who's acting as a receiver of a question.
    :query int from: The ID of the person who's acting as sender of a question.
    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 200: no error
    :statuscode 400: bad request
    :statuscode 404: there's no questions

.. _get_question:

.. http:get:: /questions/(int:question_id)

    Get the details about a question based on the ID.

    **Example request:**

    .. sourcecode:: http

        GET /questions/1234?fields="question,tags"
        Host example.com
        Accept: application/vnd.preguntale.v1+json

    **Example response:**

    .. sourcecode:: http


        {
            "_id": 1234,
            "question": "Question 1",
            "tags": ["tag1", "tag2"]
        }

    :param int question_id: ID of the question
    :query str fields: A list of comma separated question fields. Otherwise all the available fields should be returned.

    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 200: no error
    :statuscode 400: bad request
    :statuscode 404: There is no question with this ID

.. _get_supporters:

.. http:get:: /questions/(int:question_id)/supporters

    Get the details about the supporters of a question.

    **Example request:**

    .. sourcecode:: http

        GET /questions/1234/supporters?fields="first_name,last_name,city,country,signed_on"
        Host example.com
        Accept: application/vnd.preguntale.v1+json

    **Example response:**

    .. sourcecode:: http

        [
            {
                "first_name": "John",
                "last_name": "Doe",
                "city": "Monterrey",
                "country": "mx",
                "signed_on": "date"
            },
            {
                "first_name": "John",
                "last_name": "Doe",
                "city": "Monterrey",
                "country": "mx",
                "signed_on": "date"
            }
        ]

    :param int question_id: ID of the question
    :query str fields: A list of comma separated supporters fields. Otherwise all the available fields should be returned.
    :query int per_page: The maximum number of supporters objects that will be returned by request, no more than 100.
    :query int page: The offset by `per_page` supporters. Otherwise, returns the first page of supporters.
    :query str sort: The order by which the list of supporters will be returned based on the date and time the signature was created, `asc` or `desc`. Default: `desc`.

    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 200: no error
    :statuscode 400: bad request
    :statuscode 404: There is no question with this ID

.. _post_question:

.. http:post:: /questions

    Create a new question

    **Example request:**

    .. sourcecode:: http

        POST /questions
        Host example.com
        Accept: application/vnd.preguntale.v1+json
        Content-Type: application/x-www-form-urlencoded or application/json

    **Example response:**

    .. sourcecode:: http

        {
            "_id": 1234,
            "question": "Question 1",
            "tags": ["tag1", "tag2"]
        }

    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 201: created
    :statuscode 400: bad request
