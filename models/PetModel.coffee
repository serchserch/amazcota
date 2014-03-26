mongoose = require 'mongoose'
schema = mongoose.Schema


PetSchema = new schema
  name: String
  birthday: Date
  specie: String
  breed: String
  size: String
  colors: [
    _id: false
    color: String
    percent: Number
  ]  
  details: String
  
  profilephoto: String
  photos:[
    _id: false
    photourl: String
  ]
  
  # History of status adoption, lost, found 
  status:[
    _id: false
    _statusid: String 
  ]
  
  # Medical status 
  medical:
    vaccines:[
      _id: false
      vaccine: String
      dategiven: Date
      nextdosedate: Date
      details: String
    ]
    sterilized: Boolean
    dewormed: Boolean 
    
  # History of owners
  bestfriends: [
    _id: false
    _idhuman: String
  ]
  # Current owner
  currentbestfriend: String


module.exports = mongoose.model 'Pet', PetSchema