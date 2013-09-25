Backbone = require 'Backbone'

class Router extends Backbone.Router

  routes:
    '':                       'index'

    # Default action
    '*actions':                 'index'

  initialize: -> {}

  index: ->
    IndexPage = require './views/IndexPage'
    v = new IndexPage()
    app.layout.setView v

module.exports = Router
