
# Rutas necesarias para iniciar la aplicación
define [
  'jquery',
  'underscore',
  'backbone',
  'views/SplashView',
  'views/PetProfileView',
], 


# Function
($, _, Backbone, SplashView, PetProfileView)->
  
  Router = Backbone.Router.extend
    
    routes:
      '': 'showSplashView'
      'pet': 'showPetView'
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
          #Langs.LoadNameSpace 'splashmain'
          Langs.LoadNameSpace 'splashmain'        
          return
          
        else
          console.log 'lol'
        return
            
    #
    #
    #      
    AppRoutes.on 'route:showPetView', 
      
      ()->
        if !Session.get 'auth'
          view = new PetProfileView AppRoutes, Session
          view.render()
          Langs.LoadNameSpace 'petprofile'
          #Langs.putNameSpace 'petprofile'        
          return
          
        else
          console.log 'lol'
        return


    
    Backbone.history.start()
    
    
    
    return
    
    
  # Regresar el contructor  
  initialize:initialize
  
  
    



  
  
  

      
    
    
      
 