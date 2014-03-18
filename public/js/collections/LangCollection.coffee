
# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
  'models/LangModel'
],

($, _, Backbone, LangModel)->
  
  Collection = Backbone.Collection.extend
    
    model: LangModel
    
    currentLang: null
    currentNamespace: null
    
    
    namespaces: []
    
    url: ()->
      return '/lang'

    
    #
    #
    #
    initialize: (models, options)->
      return
    
    #
    #
    #
    parse: (resp, xhr)->
      this.currentLang = xhr.data.lang
      this.namespaces[xhr.data.namespace] = true
      this.currentNamespace = xhr.data.namespace
      return resp
      
    
    #
    #
    #
    putAllOnTargets: ()->
      _.each this.models, (model, key)->
        model.putOnTarget()
      return
      
      
    #
    #
    #
    putNameSpace: (namespace)->
      self = this
      
      #self.namespaces[namespace] = true
      
      if typeof self.namespaces[namespace] is 'undefined' and self.namespaces[namespace] isnt true
      
        self.namespaces[namespace] = true
        
        this.fetch
          data: lang: self.currentLang, namespace: namespace
          remove: false
          success: ()->
            self.putAllOnTargets()
            console.log self
            return

      return
    
    #
    #
    #  
    changeLang: (newLang)->
      self = this
      if(newLang isnt this.currentLang)
        this.currentLang = newLang
        this.putNameSpace this.currentNamespace
        console.log 'lang changed: ' + this.currentLang                
        
      return

  
  return Collection