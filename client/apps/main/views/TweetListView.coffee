Backbone = require 'Backbone'
TweetList = require '../models/TweetList'

class TweetListView extends Backbone.View

  template: _.tpl(require '../templates/TweetListView.html')
  tweetTemplate: _.tpl(require '../templates/_tweet.html')

  events: {}

  initialize: ->
    @$el.html @template()

    # Set up data structures backing the view
    @tweets = new TweetList()
    @tweets.on 'reset', @render
    @tweets.on 'add', @addItem
    @tweets.on 'remove', @removeItem
    @tweets.fetch {reset: true}

  addItem: (tweet) =>
    $list = @$('.tweets')
    $list.prepend @tweetTemplate({tweet: tweet.toJSON()})

  render: =>
    $list = @$('.tweets').empty()
    @tweets.each (tweet) =>
      $list.append @tweetTemplate({tweet: tweet.toJSON()})
    @

module.exports = TweetListView
