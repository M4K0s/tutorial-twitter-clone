Backbone = require 'Backbone'
Form = require 'muffin/forms'
Tweet = require '../models/Tweet'

class TweetEditView extends Backbone.View

  template: _.tpl(require '../templates/TweetEditView.html')

  events:
    'click form .btn-primary': 'onSubmit'
    'click form .btn.cancel': 'onCancel'

  initialize: (@options) ->
    @$el.html @template()

    # Set up data structures backing the view
    @model = new Tweet()
    @model.id = @options.id
    @model.on 'change', @render
    @model.fetch()

    # Set up form
    @form = new Form
      el: @$('form')
      model: @model

  render: =>
    @form.update(@model)
    @

  onSubmit: (e) ->
    # Validate the fields and update the model
    errors = @form.commit()
    return false if errors

    @model.save {},
      sender: @model
      success: (model, response) =>
        logging.debug "Updated Tweet."
        Backbone.history.navigate '#tweets', true
      error: (model, response) =>
        logging.debug "Failed to update Tweet."
    false

  onCancel: (e) ->
    Backbone.history.navigate '#tweets', true
    false

module.exports = TweetEditView
