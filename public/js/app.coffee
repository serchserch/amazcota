
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

    Languajes = ['en_US', 'es_MX', 'pt_BR']
    Random = 0
                    
    


    # Auth
    SessionModel.IsLogin ()->
      
      
      Langs.LoadDefault Languajes[Random], ()->
        Router.initialize SessionModel, Langs
        $('#Change').on 'click', (e)->
          e.preventDefault()
          Random++             
          Random = 0 if Random > 2
          Langs.ChangeLang Languajes[Random]
            
      return
      
    
    return
  
  
  initialize: initialize
  
