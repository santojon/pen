local Widget
Widget = require("pen.html").Widget
local assetpath = "assets"
local ErrorPage
do
  local _class_0
  local get_env
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      return html_5(function()
        head(function()
          title("Error")
          meta({
            charset = "UTF-8"
          })
          link({
            rel = "stylesheet",
            type = "text/css",
            href = tostring(assetpath) .. "/css/bootstrap.min.css"
          })
          link({
            rel = "stylesheet",
            type = "text/css",
            href = tostring(assetpath) .. "/css/bootstrap-theme.min.css"
          })
          link({
            rel = "stylesheet",
            type = "text/css",
            href = tostring(assetpath) .. "/css/font-awesome.min.css"
          })
          script({
            type = "text/javascript",
            src = tostring(assetpath) .. "/js/jquery-2.2.2.min.js"
          })
          script({
            type = "text/javascript",
            src = tostring(assetpath) .. "/js/bootstrap.min.js"
          })
          return link({
            rel = "stylesheet",
            type = "text/css",
            href = tostring(assetpath) .. "/css/custom.css"
          })
        end)
        return body(function()
          div({
            class = "container"
          }, function()
            h1("Error")
            pre(function()
              return text(self.err)
            end)
            h2("Traceback")
            return div({
              class = "row"
            }, function()
              return div({
                class = "col-lg-8 col-centered"
              }, function()
                return div({
                  class = "jumbotron well"
                }, function()
                  if not (self:get_env() == "production") then
                    return text(self.trace)
                  else
                    return text(self.err)
                  end
                end)
              end)
            end)
          end)
          local version = require("pen.version")
          return div({
            class = "footer"
          }, "Pen v" .. tostring(version))
        end)
      end)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "ErrorPage",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  get_env = function()
    local config = require("pen.config").get()
    return config._name
  end
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ErrorPage = _class_0
  return _class_0
end
