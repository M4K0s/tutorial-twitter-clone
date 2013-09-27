mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

UserSchema = new Schema
  email: {type: String, required: true, unique: true, set: (v) -> v.toLowerCase()}
  name: {type: String, required: true}
  openId: {type: String, required: true}
  created_at: { type: Date, default: Date.now }
  updated_at: Date

User = mongoose.model('User', UserSchema)
module.exports = User
