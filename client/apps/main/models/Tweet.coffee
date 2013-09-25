Backbone = require 'Backbone'

MIN_LENGTH = 1
MAX_LENGTH = 140

class Tweet extends Backbone.Model
  urlRoot: "<?= settings.baseURL ?>/tweets"

  @remainingCharsCount: (value) ->
    MAX_LENGTH - value

  @isTextValid: (text) ->
    text and MIN_LENGTH <= text.length <= MAX_LENGTH

module.exports = Tweet
