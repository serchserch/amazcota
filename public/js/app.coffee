
# Rutas necesarias para iniciar la aplicación
define [
  'jquery',
  'underscore',
  'backbone',
  'router',
  'models/SessionModel',
  'collections/LangCollection'
],

($, _, Backbone, Router, SessionModel, LangCollection) ->

  initialize = ()->
    
    Langs = new LangCollection




    # Auth
    SessionModel.IsLogin ()->
      
      # Lang      
      Langs.fetch
        data: lang: 'es_MX', namespace: 'splashnav' 
        success: ()->
          Router.initialize SessionModel, Langs
          

          
          $('#Change').on 'click', (e)->
            e.preventDefault()
            Languajes = ['en_US', 'es_MX']          
            Random = (Math.floor Math.random() * 2) 
            
            #console.log Languajes[Random]
            Langs.changeLang Languajes[Random]
            return
            
          return
                
      return
      
    
    return
  
  
  initialize: initialize
  
