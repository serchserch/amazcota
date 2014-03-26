_ = require 'underscore'
LangModel = require '../models/LangModel'


SupportLanguajes = ['es_MX', 'en_US', 'pt_BR']


#
#
#
exports.get = (req, res)->
    
  if req.query.namespace? and req.query.lang?
  
    namespace = req.query.namespace 
    languaje = req.query.lang 
    
    if languaje in ['es_MX', 'en_US', 'pt_BR']
      languaje = languaje
    else
      languaje = 'es_MX'
   

    LangModel.find 
      'namespace' : req.query.namespace 
    ,
      (err, Langs)->
        #console.log Langs
        #res.send Langs
        
        
        if err
          console.error err 
          return null
        
        NewLang = []
 
        _.each Langs, (val, key)->
          NewLang.push
            _id: val._id
            target: val.target
            namespace: val.namespace
            content: _.findWhere(val.langs , lang: languaje).content
            lang: languaje
          return
        res.send NewLang
        
        return

  
  else
    res.send error: 'error'
  
  return