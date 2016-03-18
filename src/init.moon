application = require "pen.application"
lapisApp = require "lapis.application"

import App from application

app_cache = lapisApp.app_cache

serve = lapisApp\serve

{
  :serve, :application, :App, :app_cache
}