
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
          return
                
      return
      
    
    return
  
  
  initialize: initialize
  
