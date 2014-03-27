

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
    
    Flag: false
    
    
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
      

        
      #@canvas()
      return
      
  
  
    #
    # After initializa DOM manipulation
    # common
    #
    render: ()->
      $('#logo').html _.template SVGLogo
      return
  
    canvas: ()->
      $video = $('#video')[0]
      ctx = $video.getContext '2d'
      $img = $('<img/>', 
        attr:
           id: 'ss'
        style: 'display: none'
        src: 'http://root:chinitossucks@172.19.0.202/axis-cgi/jpg/image.cgi?resolution=160x120&compression=50'
      )
      #http://root:1234@190.183.222.194:8101/mjpg/video.mjpg?resolution=160x120&compression=50
      #http://root:chinitossucks@172.19.0.202/axis-cgi/mjpg/video.cgi
      #http://root:toor@187.237.42.201:20001
      #http://172.19.0.202/mjpg/video.mjpg
      #http://root:chinitossucks@172.19.0.202/mjpg/video.mjpg
      #http://root:chinitossucks@172.19.0.202/axis-cgi/jpg/image.cgi
      

      
      if !@Flag
        $img.load ()-> 
          @Flag = true
          cache = $(this)
          $img.remove()
          $img2 = cache          
          setInterval ()-> 
            $img2.attr 'src' , 'http://root:chinitossucks@172.19.0.202/axis-cgi/jpg/image.cgi?resolution=160x120&compression=50'
            ctx.drawImage($img2[0],10,10);           
          , 1000
          #ctx.drawImage($img2[0],10,10);  
      
      $img.appendTo('body')
            
      return
  # Return this view varibale
  View
    
      
  
