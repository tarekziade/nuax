local Response = {}
Response.__index = Response

function Response.create()
   local resp = {}
   setmetatable(resp, Response)
   resp.json = {}
   resp.status = 200
   resp.content_type = 'application/json'
   return resp
end



local _module = {}

_module.Response = Response
return _module
