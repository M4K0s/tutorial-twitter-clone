TweetController = require './controllers/TweetController'

# Router
router = (app) ->

  # Tweet
  app.get '/tweets', TweetController.index
  app.get '/tweets/:id', TweetController.show
  app.post '/tweets', TweetController.create
  app.put '/tweets/:id', TweetController.update
  app.delete '/tweets/:id', TweetController.destroy

module.exports = router
