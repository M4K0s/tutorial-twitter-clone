TweetController = require './controllers/TweetController'
RecommendedController = require './controllers/RecommendedController'

# Router
router = (app) ->
  app.namespace '/users/:id', ->
    # Tweets
    app.get '/tweets', app.authenticate, TweetController.index
    app.get '/timeline', app.authenticate, TweetController.timeline
    app.post '/tweets', app.authenticate, TweetController.create
    app.delete '/tweets/:tid', app.authenticate, TweetController.destroy

    # Recommended people to follow
    app.get '/recommended', app.authenticate, RecommendedController.index

module.exports = router
