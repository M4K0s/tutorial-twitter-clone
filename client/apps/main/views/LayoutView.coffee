Backbone = require 'Backbone'
ComposeView = require './ComposeView'
require 'buckwilson/Lightbox_me'

class LayoutView extends Backbone.View

  template: _.tpl(require '../templates/LayoutView.html')

  events:
    'click .btn-compose': 'showComposeView'

  initialize: ->
    @$el.html @template()

  render: => @

  setView: (v) ->
    @$('#page-container').html v.render().el

  showComposeView: ->
    v = new ComposeView()
    v.render()
    v.$el.lightbox_me
      centered: true
      destroyOnClose: true

module.exports = LayoutView
