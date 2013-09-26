Backbone = require 'Backbone'

class LoginPage extends Backbone.View

  template: _.tpl(require '../templates/LoginPage.html')

  events: {}

  initialize: ->
    @$el.html @template()

  render: => @

module.exports = LoginPage
