application = require "pen.application"
lapisApp = require "lapis.application"

import App from application

app_cache = lapisApp.app_cache
setmetatable app_cache, __mode: "k"

serve = lapisApp\serve

{
  :serve, :application, :App, :app_cache
}