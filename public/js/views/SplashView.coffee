

# Import necessary libraries
define [
  'jquery'
  'underscore'
  'backbone'
  'text!templates/SplashTemplate.html'
  'text!../../img/logo.svg'
],


($, _, Backbone, SplashTemplate, SVGLogo)->
  
  
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
      'click #Change' : ''
      
      
      
    #
    # View constructor
    #
    initialize: (Routes, Session)->
      
      # do something
      @$el.removeAttr 'class'
      @$el.addClass 'SplashTemplate'
      
      
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
      @$el.html CompiledTemplate
      
      
      return
      
  
  
    #
    # After initializa DOM manipulation
    # common
    #
    render: ()->
      $('#logo').html _.template SVGLogo
      return
  
  
  # Return this view varibale
  View
    
      
  
