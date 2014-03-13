Users
=====

 * :ref:`Get users <get_users>`
 * :ref:`Get a user by ID <get_user>`
 * :ref:`Get questions created by user ID <get_questions_by_user_id>`
 * :ref:`Get votes by user ID <get_votes_by_user_id>`

.. note::

    * Add support for HATEOAS_
    * Show the available fields for every user
    * Add support for create a new user

.. _HATEOAS: http://en.wikipedia.org/wiki/HATEOAS

.. _get_users:

.. http:get:: /users

    Get the details about the lasts created users.

    **Example request:**

    .. sourcecode:: http

        GET /users?fields="first_name,last_name,city,country,signed_on"
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

    :query str fields: A list of comma separated users fields. Otherwise all the available fields should be returned.
    :query int per_page: The maximum number of users objects that will be returned by request, no more than 100.
    :query int page: The offset by `per_page` users. Otherwise, returns the first page of users.
    :query str sort: The order by which the list of users will be returned based on the date and time the user was created, `asc` or `desc`. Default: `desc`.

    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 200: no error
    :statuscode 400: bad request
    :statuscode 404: Nobody has not registered yet.

.. _get_user:

.. http:get:: /users/(int:user_id)

    Get the details about the user.

    **Example request:**

    .. sourcecode:: http

        GET /users/1?fields="first_name,last_name,city,country,signed_on"
        Host example.com
        Accept: application/vnd.preguntale.v1+json

    **Example response:**

    .. sourcecode:: http

        {
            "first_name": "John",
            "last_name": "Doe",
            "city": "Monterrey",
            "country": "mx",
            "signed_on": "date"
        }

    :query str fields: A list of comma separated users fields. Otherwise all the available fields should be returned.

    :reqheader Accept: `application/vnd.preguntale.v1+json`
    :resheader Content-Type: `application/json`
    :resheader X-RateLimit-Limit: 1000 per day
    :resheader X-RateLimit-Remaining: Number of requests remaining
    :resheader X-RateLimit-Reset: The time at which the current rate limit window resets (epoch time)

    :statuscode 200: no error
    :statuscode 400: bad request
    :statuscode 404: There is no user with this ID.
