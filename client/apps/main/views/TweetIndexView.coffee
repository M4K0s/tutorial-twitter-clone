Backbone = require 'Backbone'
TweetList = require '../models/TweetList'

class TweetIndexView extends Backbone.View

  template: _.tpl(require '../templates/TweetIndexView.html')
  tbodyTemplate: _.tpl(require '../templates/TweetListTable.html')

  events:
    'click a.delete': 'onDelete'

  initialize: ->
    @$el.html @template()

    @fields = @$('table thead th:gt(0)').map ->
      $(this).attr('data-field')
    .get()

    # Set up data structures backing the view
    @collection = new TweetList()
    @collection.on 'reset', @render
    @collection.on 'add', @render
    @collection.on 'remove', @render
    @collection.fetch {reset: true}

  render: =>
    $tbody = @$('table tbody').empty()
    $tbody.html @tbodyTemplate({tweets: @collection.toJSON(), fields: @fields})
    @

  onDelete: (e) ->
    index = $(e.currentTarget).closest('tr').index()
    @collection.at(index).destroy()

module.exports = TweetIndexView
