Backbone = require 'Backbone'

class User extends Backbone.Model
  urlRoot: "<?= settings.baseURL ?>/users"

module.exports = User
