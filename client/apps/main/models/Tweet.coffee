Backbone = require 'Backbone'

class Tweet extends Backbone.Model
  urlRoot: "<?= settings.baseURL ?>/tweets"

module.exports = Tweet
