mongoose = require 'mongoose'
schema = mongoose.Schema 

#
# DB Models
#

LangSchema = new schema
  target: String
  namespace: String
  langs:[
    lang: String
    content: String
  ]


module.exports = mongoose.model 'Lang', LangSchema