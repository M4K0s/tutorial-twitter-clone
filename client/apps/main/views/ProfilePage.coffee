Backbone = require 'Backbone'

class ProfilePage extends Backbone.View

  template: _.tpl(require '../templates/ProfilePage.html')

  events: {}

  initialize: ->
    @$el.html @template()

  render: => @

module.exports = ProfilePage
