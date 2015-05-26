====
Nuxa
====

Nuxa is a micro-framework based on OpenResty to write simple JSON web services.


Example::

    # nginx.conf
    http {
    server {
        listen 80;

        location / {
        content_by_lua '
            local app = require "nuxa"

            app:get("/hello/:name", function(request, response)
                response.json = {Hello=request.urlmatch.name}
            end)

            app.main()
        '
    }
  }


To build your app, all you have to do is match a method and a path
to a function. The function will get a request and a response
object and has to fill in the json content of the response
object (or more things if needed).

Nuxa is based on a simple routing module found at https://docs.apitools.com/blog/2014/04/24/a-small-router-for-openresty.html
and a few more ideas taken from the Python world.
