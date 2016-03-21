-- Needed to creat an pen app
pen = require "pen"

-- Other things
util = require "pen.util"
encoding = require "pen.util.encoding"
json = require "cjson"

-- App REQUIRED variables
-- SET IT into config.moon
base = ""
appName = "penapp"
controllerNames = { "" }

--
-- Main app class
--
class App extends pen.Application

  -- Define main layout for all pages
  layout: require "views.layouts.main"

  -- Define a filter to run every time a request is made
  @before_filter =>
    if @session.user
      @@current_user = load_user @session.user
      generate_csrf @

    if @current_user
        @current_user\update_last_active!
        @global_notifications = @current_user\unseen_notifications!

    if @session.flash
      @flash = @session.flash
      @session.flash = false

  -- Subapplications includes (controllers)
  @include "controllers.#{val}", path: "#{base}/#{val}", name: "#{val}_" for val in *controllerNames

  --


  --
  -- Default routes
  --

  -- Homepage
  [index: "#{base}/"]: =>
    render: true	-- render views/index.lua

  -- Denied page
  [denied: "#{base}/403"]: =>
    render: "layouts.403", status: 403

  -- Not found page
  [notFound: "#{base}/404"]: =>
    render: "layouts.404", status: 404

  -- Internal server error page
  [notFound: "#{base}/500"]: =>
    render: "layouts.500", status: 500