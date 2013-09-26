#
# The Auth app handles user authentication and sessions.
#

Router = require './router'

class App

  initialize: -> {}

  createRouter: ->
    @router = new Router

module.exports = App
