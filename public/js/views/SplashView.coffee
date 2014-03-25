

# Import necessary libraries
define [
  'jquery'
  'underscore'
  'backbone'
  'models/PetModel'
  'collections/PetCollection'
  'text!templates/SplashTemplate.html'
  'text!../../img/logo.svg'
  'text!templates/PetItemTemplate.html'
],


($, _, Backbone, PetModel, PetCollection, SplashTemplate, SVGLogo, PetItemTemplate)->
  
  
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
      
      self = @
      
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
      
      PopularPets = new PetCollection [], requrl: 'popular'
      
      # Pet = new PetModel id: '532fb5d304348cf01b3778b9'
      # Pet.fetch success: (Data)->
        # PopularPets.add Data
        
      PopularPets.fetch success: (ResultPets)->
        $target = self.$el.find('section:nth-child(2)').find('section')
        _.each ResultPets.models, (Pet, key)->    
          console.log Pet.toJSON()
          $target.append _.template PetItemTemplate, Pet.toJSON()
          
        return
      

        
      
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
    
      
  
