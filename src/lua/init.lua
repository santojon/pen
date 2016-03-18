local application = require("pen.application")
local lapisApp = require("lapis.application")
local app_cache = lapisApp.app_cache
local App
App = application.App
local serve
do
  local _base_0 = lapisApp
  local _fn_0 = _base_0.serve
  serve = function(...)
    return _fn_0(_base_0, ...)
  end
end
return {
  serve = serve,
  application = application,
  App = App,
  app_cache = app_cache
}
