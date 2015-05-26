local nuxa = require "nuxa"


nuxa:get("/", function(request, response)
    response.json = {Hello= "World"} 
end)


nuxa:get("/hello/:name", function(request, response)
    response.json = {Hello= request.urlmatch.name}
end)



nuxa:main()
