local nuax = require "nuax"


nuax:get("/", function(request, response)
    response.json = {Hello= "World"} 
end)


nuax:get("/hello/:name", function(request, response)
    response.json = {Hello= request.urlmatch.name}
end)



nuax:main()
