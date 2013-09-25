Backbone = require 'Backbone'

class ComposeView extends Backbone.View

  template: _.tpl(require '../templates/ComposeView.html')

  events: {}

  initialize: ->
    @$el.html @template()

  render: => @

module.exports = ComposeView
