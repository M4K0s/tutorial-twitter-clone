Backbone = require 'Backbone'
TweetListView = require './TweetListView'

class IndexPage extends Backbone.View

  template: _.tpl(require '../templates/IndexPage.html')

  events: {}

  initialize: ->
    @$el.html @template()

    # Show a list of tweets on the right
    @tweetListView = new TweetListView {el: @$('.tweet-list-view')}

  render: => @

module.exports = IndexPage
