
# Rutas necesarias para iniciar la aplicación
define [
  'jquery',
  'underscore',
  'backbone',
  'views/SplashView'
], 


# Function
($, _, Backbone, SplashView)->
  
  Router = Backbone.Router.extend
    
    routes:
      '': 'showSplashView'
      '*actions': 'defaultAction'
      
      
  initialize = (Session, Langs) ->
    
    AppRoutes = new Router
     
     
    #
    #
    #      
    AppRoutes.on 'route:showSplashView', 
      
      ()->
        if !Session.get 'auth'
          view = new SplashView AppRoutes, Session
          view.render()
          Langs.putNameSpace 'splashmain'
          Langs.putNameSpace 'splashmain'
          Langs.putNameSpace 'splashnav'  

          Langs.changeLang 'en_US'
          
          return
          
        else
          console.log 'lol'
        return
            
    
    Backbone.history.start()
    
    
    
    return
    
    
  # Regresar el contructor  
  initialize:initialize
  
  
    



  
  
  

      
    
    
      
 