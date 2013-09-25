Backbone = require 'Backbone'

class Router extends Backbone.Router

  routes:
    # Tweet
    'tweets':                    'tweets_index'
    'tweets/new':                'tweets_new'
    'tweets/:id':                'tweets_show'
    'tweets/:id/edit':           'tweets_edit'

    '':                       'index'

    # Default action
    '*actions':                 'index'

  initialize: -> {}

  index: ->
    logging.debug 'show index page'

  tweets_index: ->
    TweetIndexView = require './views/TweetIndexView'
    v = new TweetIndexView
    app.layout.setView v

  tweets_new: ->
    TweetNewView = require './views/TweetNewView'
    v = new TweetNewView
    app.layout.setView v

  tweets_show: (id) ->
    TweetShowView = require './views/TweetShowView'
    v = new TweetShowView {id}
    app.layout.setView v

  tweets_edit: (id) ->
    TweetEditView = require './views/TweetEditView'
    v = new TweetEditView {id}
    app.layout.setView v

module.exports = Router
