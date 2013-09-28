Backbone = require 'Backbone'

class ProfileSummaryView extends Backbone.View

  className: 'profile-view'
  template: _.tpl(require '../templates/ProfileSummaryView.html')

  events: {}

  initialize: -> {}

  render: =>
    data = {user: @model.toJSON()}
    @$el.html @template(data)
    @

module.exports = ProfileSummaryView
