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


local _module = {}

_module.Request = Request
return _module
