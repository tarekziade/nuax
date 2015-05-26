local Request = {}
Request.__index = Request

function Request.create()
   local req = {}
   setmetatable(req, Request)
   req.method = ngx.req.get_method()
   req.path = ngx.var.request_uri
   req.args = ngx.req.get_uri_args()
   req.headers = ngx.req.get_headers()
   return req
end


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

_module.Request = Request
_module.Response = Response
return _module
