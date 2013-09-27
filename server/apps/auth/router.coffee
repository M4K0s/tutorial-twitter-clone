passport = require 'passport'
GoogleStrategy = require('passport-google').Strategy
User = require './models/User'

# Serialization
passport.serializeUser (user, done) ->
  done(null, user._id)

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done(err, user)

# Use Google strategy
passport.use(new GoogleStrategy {
  returnURL: 'http://localhost:4000/api/v1/verify'
  realm: 'http://localhost:4000/'
}, (identifier, profile, done) ->
  user = User.findOne {openId: identifier}, (err, user) ->
    if user
      user.name = profile.displayName
      user.email = profile.emails[0].value
    else
      user = new User {openId: identifier, name: profile.displayName, email: profile.emails[0].value}
    user.save (err) ->
      done(err, user)
)

# Router
router = (app) ->
  # Authentication middleware
  app.authenticate = (req, res, next) ->
    if req.session.passport.user?
      User.findById req.session.passport.user, (err, user) ->
        if user
          req.user = user
          next()
        else
          res.send(401)
    else
      res.send(401)

  app.get '/login', passport.authenticate('google')

  app.get '/verify', passport.authenticate('google', {
    successRedirect: '/'
    failureRedirect: '/#login'
  })

  app.get '/session', app.authenticate, (req, res) ->
    res.send {user: req.user}

module.exports = router
