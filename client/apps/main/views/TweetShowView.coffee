Backbone = require 'Backbone'
Tweet = require '../models/Tweet'

class TweetShowView extends Backbone.View

  template: _.tpl(require '../templates/TweetShowView.html')

  events: {}

  initialize: (@options) ->
    # Set up data structures backing the view
    @model = new Tweet()
    @model.id = @options.id
    @model.on 'change', @render
    @model.fetch()

  render: =>
    @$el.html @template({model: @model.toJSON()})
    @

module.exports = TweetShowView
