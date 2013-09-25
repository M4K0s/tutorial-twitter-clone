Backbone = require 'Backbone'
Tweet = require './Tweet'

class TweetList extends Backbone.Collection
  model: Tweet
  url: "<?= settings.baseURL ?>/tweets"

  comparator: (model) ->
    -(new Date(model.get('created_at'))).getTime()

module.exports = TweetList
