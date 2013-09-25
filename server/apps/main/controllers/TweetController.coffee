Tweet = require '../models/Tweet'

TweetController = 
  # GET /tweets
  index: (req, res) ->
    Tweet.find {}, (err, tweets) ->
      res.send tweets
  
  # POST /tweets
  create: (req, res) ->
    tweet = new Tweet(req.body)
    tweet.created_at = tweet.updated_at = new Date
    tweet.save (err) ->
      if err then res.send(err, 422) else res.send(tweet)
  
  # GET /tweets/:id
  show: (req, res) ->
    Tweet.findById req.params.id, (err, tweet) ->
      if tweet
        res.send(tweet)
      else
        res.send(404)
  
  # PUT /tweets/:id
  update: (req, res) ->
    Tweet.findById req.params.id, (err, tweet) ->
      if tweet
        tweet.updated_at = new Date
        tweet.set req.body
        tweet.save (err) ->
          if err then res.send(err, 422) else res.send(tweet)
      else
        res.send(404)
  
  # DELETE /tweets/:id
  destroy: (req, res) ->
    Tweet.findById req.params.id, (err, tweet) ->
      if tweet
        tweet.remove -> res.send(200)
      else
        res.send(404)

module.exports = TweetController
