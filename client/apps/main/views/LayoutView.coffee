Backbone = require 'Backbone'

class LayoutView extends Backbone.View

  template: _.tpl(require '../templates/LayoutView.html')

  events: {}

  initialize: ->
    @$el.html @template()

  render: => @

  setView: (v) ->
    @$('#page-container').html v.render().el

module.exports = LayoutView
