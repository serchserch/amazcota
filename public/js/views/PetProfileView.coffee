

# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
  'text!templates/PetProfileTemplate.html'
],


($, _, Backbone, PetProfileTemplate)->
  
  
  View = Backbone.View.extend
  
    el: '#container'
       
    #
    #
    #
    events:
      'click #uploader': 'resize'
       
       
    #
    # View constructor
    #
    initialize: (Routes, Session)->
      
     
      console.log 'hey pet'  
      # Compile template  
      CompiledTemplate = _.template PetProfileTemplate 
      
      
      # Append Template
      this.$el.html CompiledTemplate    
         
      return
    
    resize: (e)->
      e.preventDefault()
      canvas = $(e.target)[0]
      context = canvas.getContext '2d'
      x = 100
      y = 30
      width = 100
      height = 100
      imageObj = new Image()
      imageObj.onload = ()->
        context.drawImage imageObj, x, y, width, height
        blob = dataURItoBlob canvas.toDataURL imageEncoding
        console.log blob
      imageObj.src = 'http://newknd.com/photos/RachelBilson1568294334.jpg'
      
      
