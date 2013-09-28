#
# The Auth app handles user authentication and sessions.
#

Router = require './router'
Session = require './models/Session'

class App

  initialize: ->
    @session = new Session

    # Set a global error handler
    $(document).on 'ajaxError', @globalErrorHandler

  createRouter: ->
    @router = new Router

  # Force a redirect by resetting the hash first.
  redirect: (hash) ->
    @router.navigate '#!'
    @router.navigate hash, true

  # Check if the user is already logged in.
  getSession: ->
    @session.fetch
      success: (model, response) =>
        if model.user?.id
          # The session is still valid.
          @redirect window.location.hash
        else
          @clearSession()
          @redirect '#login'
      error: (model, xhr) =>
        @clearSession()
        @redirect '#login'

  # Clear the session
  clearSession: ->
    @session.clear()

  # Global error handler
  globalErrorHandler: (event, xhr, settings, thrownError) =>
    if xhr.status is 401
      @clearSession()
      @redirect '#login'

module.exports = App
