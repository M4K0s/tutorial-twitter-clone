Backbone = require 'Backbone'
Tweet = require './Tweet'

class TweetList extends Backbone.Collection
  model: Tweet
  url: "<?= settings.baseURL ?>/tweets"

module.exports = TweetList
