

# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
  'text!templates/SplashTemplate.html'
],


($, _, Backbone, SplashTemplate)->
  
  
  View = Backbone.View.extend
  
    el: '#container'
    
    # Variable for check authorization and authentication
    Session: null
    
    # Variable for manipulate routes
    Routes: null
    
    
    #
    # Events linked to this view
    #
    events:
      'click #sigin' : ''
      
    #
    # View constructor
    #
    initialize: (Routes, Session)->
      
      # do something
      
      # Data for menu
      
      MenuData =
        main: 'Menu'
        explore: 'Explorar'
        amazcota: 'Amazcota'
        login: 'Iniciar Sesión'
        search: 'Buscar'
      
      
      # Data to template
      Data = 
        title: 'blabla'
        menu: MenuData
        
      # Compile template  
      CompiledTemplate = _.template SplashTemplate, Data
      
      
      # Append Template
      this.$el.append CompiledTemplate    
      
      
      
      return
      
  
    #
    # After initializa DOM manipulation
    # common
    #
    render: ()->
      # do something
      return
  
  
  # Return this view varibale
  View
    
      
  
