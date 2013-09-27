Backbone = require 'Backbone'
TweetList = require '../models/TweetList'
TweetListView = require './TweetListView'
WhoToFollowCard = require '../views/WhoToFollowCard'

class IndexPage extends Backbone.View

  template: _.tpl(require '../templates/IndexPage.html')

  events: {}

  initialize: ->
    @$el.html @template()

    # Show "Who to Follow" card in the sidebar
    @whoToFollowCard = new WhoToFollowCard()
    @$('aside').append @whoToFollowCard.render().el

    # Create a TweetList collection
    tweets = new TweetList()
    tweets.type = 'timeline'
    tweets.user = app.currentUser

    # Show tweets in the content area
    @tweetListView = new TweetListView {collection: tweets}
    @$('.tweet-list-view').html @tweetListView.render().el

  render: => @

module.exports = IndexPage
