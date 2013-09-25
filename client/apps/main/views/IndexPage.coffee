Backbone = require 'Backbone'

class IndexPage extends Backbone.View

  template: _.tpl(require '../templates/IndexPage.html')

  events: {}

  initialize: ->
    @$el.html @template()

  render: => @

module.exports = IndexPage
