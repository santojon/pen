local pen = require("pen")
local util = require("pen.util")
local encoding = require("pen.util.encoding")
local json = require("cjson")
local base = ""
local appName = "penapp"
local controllerNames = { }
local App
do
  local _class_0
  local _parent_0 = pen.Application
  local _base_0 = {
    layout = require("views.layouts.main"),
    [{
      index = tostring(base) .. "/"
    }] = function(self)
      return {
        render = true
      }
    end,
    [{
      denied = tostring(base) .. "/403"
    }] = function(self)
      return {
        render = "layouts.403",
        status = 403
      }
    end,
    [{
      notFound = tostring(base) .. "/404"
    }] = function(self)
      return {
        render = "layouts.404",
        status = 404
      }
    end,
    [{
      notFound = tostring(base) .. "/500"
    }] = function(self)
      return {
        render = "layouts.500",
        status = 500
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "App",
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
  self.__class:before_filter(function(self)
    if self.__class.session.user then
      self.__class.current_user = load_user(self.__class.session.user)
      generate_csrf(self)
    end
    if self.__class.current_user then
      self.__class.current_user:update_last_active()
      self.__class.global_notifications = self.__class.current_user:unseen_notifications()
    end
    if self.__class.session.flash then
      self.__class.flash = self.__class.session.flash
      self.__class.session.flash = false
    end
  end)
  if controllerNames then
    for _index_0 = 1, #controllerNames do
      local val = controllerNames[_index_0]
      self.__class:include("controllers." .. tostring(val), {
        path = tostring(base) .. "/" .. tostring(val),
        name = tostring(val) .. "_"
      })
    end
  end
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  App = _class_0
  return _class_0
end
