local router = require "router"
local app = router.new()


app:get("/", function(request, response)
    response.json = {Hello= "World"} 
end)


app:get("/hello/:name", function(request, response)
    response.json = {Hello= request.urlmatch.name}
end)



app:main()
