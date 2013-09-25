Backbone = require 'Backbone'
TweetList = require '../models/TweetList'

class TweetListView extends Backbone.View

  template: _.tpl(require '../templates/TweetListView.html')

  events: {}

  initialize: ->
    @$el.html @template()

    # Set up data structures backing the view
    @collection = new TweetList()
    @collection.on 'reset', @render
    @collection.on 'add', @render
    @collection.on 'remove', @render
    @collection.fetch {reset: true}

  render: => @

module.exports = TweetListView
