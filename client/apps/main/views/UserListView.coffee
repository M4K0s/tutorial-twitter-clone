Backbone = require 'Backbone'

class UserListView extends Backbone.View

  template: _.tpl(require '../templates/UserListView.html')
  userTemplate: _.tpl(require '../templates/_user.html')

  events: {}

  initialize: (@options) ->
    @$el.html @template()

    # Set header
    @type = @options.type
    switch @type
      when 'following'
        @$('.users-header h3').text 'Following'
      when 'followers'
        @$('.users-header h3').text 'Followers'

    # Set up data structures backing the view
    @collection.on 'reset', @render
    @collection.fetch {reset: true}

  render: =>
    $list = @$('.users').empty()
    @collection.each (user) =>
      $list.append @userTemplate({user: user.toJSON(), type: @type})
    @

module.exports = UserListView
