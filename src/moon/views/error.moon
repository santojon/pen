import Widget from require "pen.html"

assetpath = "assets"

class ErrorPage extends Widget

  get_env = ->
    config = require("pen.config").get!
    config._name

  content: =>
    html_5 ->
      head ->
        title "Error"
        meta charset: "UTF-8"

        -- 
        -- Basic assets
        -- 

        -- CSS
        link rel: "stylesheet", type: "text/css", href: "#{assetpath}/css/bootstrap.min.css"
        link rel: "stylesheet", type: "text/css", href: "#{assetpath}/css/bootstrap-theme.min.css"

        -- FONTS
        link rel: "stylesheet", type: "text/css", href: "#{assetpath}/css/font-awesome.min.css"

        -- JS
        script type: "text/javascript", src: "#{assetpath}/js/jquery-2.2.2.min.js"
        script type: "text/javascript", src: "#{assetpath}/js/bootstrap.min.js"

        -- 
        -- Custom assets
        -- 

        -- CSS
        link rel: "stylesheet", type: "text/css", href: "#{assetpath}/css/custom.css"
      body ->
        div class: "container", ->
          h1 "Error"
          pre ->
            text @err

          h2 "Traceback"

          div class: "row", ->
              div class: "col-lg-8 col-centered", ->
                div class: "jumbotron well", ->
                  unless @get_env! == "production"
                    text @trace
                  else
                    text @err

        version = require "pen.version"
        div class: "footer", "Pen v#{version}"