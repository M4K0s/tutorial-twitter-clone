Backbone = require 'Backbone'
Form = require 'muffin/forms'
Tweet = require '../models/Tweet'

class TweetNewView extends Backbone.View

  template: _.tpl(require '../templates/TweetNewView.html')

  events:
    'click form .btn-primary': 'onSubmit'
    'click form .btn.cancel': 'onCancel'

  initialize: ->
    @$el.html @template()

    # Set up data structures backing the view
    @model = new Tweet()

    # Set up form
    @form = new Form
      el: @$('form')
      model: @model

  render: => @

  onSubmit: (e) ->
    # Validate the fields and update the model
    errors = @form.commit()
    return false if errors

    @model.save {},
      sender: @model
      success: (model, response) =>
        logging.debug "Created Tweet."
        Backbone.history.navigate '#tweets', true
      error: (model, response) =>
        logging.debug "Failed to create Tweet."
    false

  onCancel: (e) ->
    Backbone.history.navigate '#tweets', true
    false

module.exports = TweetNewView
