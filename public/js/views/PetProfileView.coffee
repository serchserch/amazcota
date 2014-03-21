

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
    # View constructor
    #
    initialize: (Routes, Session)->
      
     
      console.log 'hey pet'  
      # Compile template  
      CompiledTemplate = _.template PetProfileTemplate 
      
      
      # Append Template
      this.$el.html CompiledTemplate    
      
      
      
      return