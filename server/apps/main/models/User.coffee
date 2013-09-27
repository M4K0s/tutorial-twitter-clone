mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId
Tweet = require './Tweet'
User = require '../../auth/models/User'

# Add a few more fields to the schema
UserSchema = User.schema
UserSchema.add
  username: [type: String, required: true]
  profileImageUrl: String

  tweets: [{type: ObjectId, ref: 'Tweet'}]
  tweetsCount: {type: Number, default: 0}

  following: [{type: ObjectId, ref: 'User'}]
  followingCount: {type: Number, default: 0}

  followers: [{type: ObjectId, ref: 'User'}]
  followersCount: {type: Number, default: 0}

module.exports = User
