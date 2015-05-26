====
Nuax
====

Nuax is a micro-framework based on OpenResty to write simple JSON web services.


Example::

    # nginx.conf
    http {
    server {
        listen 80;

        location / {
        content_by_lua '
            local app = require "nuax"

            app:get("/hello/:name", function(request, response)
                response.json = {Hello=request.urlmatch.name}
            end)

            app.main()
        '
        }
      }

Of course you can separate the Lua code into its own module and
use **content_by_lua_file**.

To build your app, all you have to do is define HTTP methods
(like **app:get()**) and routes (like "/hello/:name") combos.

When app.main() is called through Nginx's root location it will
try to find a corresponding match. If any is found, a Request
object is built using Nginx's request environment and a Response
object is prepared.

From there, all you have to do is fill **response.json** with 
whatever JSON data you want to send back to the user.

Your Lua functions can access everything OpenResty has to offer
of course and use whatever libraries you want.

