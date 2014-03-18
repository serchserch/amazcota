
# Define necessary libs

define [
  'jquery',
  'underscore',
  'backbone',
  'facebook',
],


($, _, Backbone, Facebook)->
  
  Model = Backbone.Model.extend
    
    urlRoot: '/session'
    
    logged: false
    
    FB: null


    #
    #
    #
    defaults:
      auth: false
      
      
    
    #
    #
    #
    initialize: ()->
      ###
      this.FB
      this.FB.init
        appId : ''
        status: true
        cookie: true
        xfbml : true
      ###  
      return



    #
    #
    #
    Login: (Creds, Callback)->
      self = this
      return
      
    
    #
    #
    #
    Logout: (Callback)->
      return
    
    
    #
    #
    #  
    IsLogin: (Callback)->
      # Shoot callback
      Callback()
      return
      
    
    #
    #
    #
    IsAuth: (Callback)->
      return
      
    
  new Model();  
