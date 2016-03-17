-- Needed to creat an lapis app
lapis = require "lapis"

-- The app config instance
config = require("lapis.config").get!

--
-- Main app class
-- App code starts here
--
-- Defines the main routes ONLY
--
class App extends lapis.Application