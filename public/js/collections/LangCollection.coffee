
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
    
    defaultNameSpace: 'splashnav'
    defaultCollection: null
    
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
      #this.currentNamespace = xhr.data.namespace 
      resp
      
    
    
    
    #
    #
    #
    PutAllOnTargets: ()->
      _.each this.models, (model, key)->
        model.putOnTarget()
      return
      
    
    
    
    
      
    #
    #
    #  
    LoadDefault: (Lang, Callback)->

      self = @      
    
      return null if @defaultCollection?           

      @currentLang = Lang
      
      @fetch
        data: lang: Lang, namespace: @defaultNameSpace
        remove: true
        success: (Contents)->         
          self.PutAllOnTargets()
          self.defaultCollection = Contents.toJSON()
          if Callback? 
            Callback?()
          return
          
      return
    
      
    #
    #
    #  
    LoadNameSpace: (NameSpace, Callback)->
      self = @   
      #if !@defaultCollection?
      #  @LoadDefault  
      
      @currentNamespace = NameSpace
    
      @fetch
        data: lang: @currentLang, namespace: NameSpace
        remove: true
        success: (Contents)->
          console.log 'defaults'
          console.log self.defaultCollection
          self.add(self.defaultCollection, {silent : true})      
          self.PutAllOnTargets()
          console.log self
          if Callback? 
            Callback?()
          return
          
      return
    
    
    #
    #
    #
    ChangeLang: (Lang, Callback)->
      @defaultCollection = null
      @LoadDefault Lang
      @LoadNameSpace @currentNamespace
      return
    
      
    #
    #
    #
    putNameSpace: (namespace)->
      
      #@putDefaults()
      
    
      self = this
   
      _fetch = ()->
        self.fetch
          data: lang: self.currentLang, namespace: namespace
          remove: true
          success: ()->
            self.PutAllOnTargets()
            console.log self
            return
        return
    
    
      if self.currentNamespace isnt namespace
        self.currentNamespace = namespace
        _fetch()    

      return
    
    
    
    
    
    #
    #
    #  
    changeLang: (newLang)->
      self = @
      if(newLang isnt this.currentLang)
        
        @currentLang = newLang      

        _fetch = (lang, namespace, init)->
          self.fetch
            data: lang: lang, namespace: namespace
            remove: init
            success: ()->
              self.putAllOnTargets()
              console.log self
              return
          return
        

        _fetch newLang, @currentNamespace , false
        
        _.each this.defaultsNameSpaces, (value, key)->
          _fetch newLang, value, true
          return             
        
      return

  #return collection
  Collection