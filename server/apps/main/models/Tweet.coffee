mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

TweetSchema = new Schema
  text: String
  created_at: { type: Date, default: Date.now }
  updated_at: Date

Tweet = mongoose.model('Tweet', TweetSchema)
module.exports = Tweet
