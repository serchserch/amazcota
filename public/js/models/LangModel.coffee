
# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
],


($, _, Backbone)->
  
  Model = Backbone.Model.extend
    
    
    #
    #
    #
    initialize: ()->
      return
    
    
    #
    #
    #
    putOnTarget: ()->
      $target = $(this.get 'target');
      tag = $target.get(0).tagName
      if tag in ['SPAN', 'EM', 'P', 'STRONG', 'BUTTON'] 
        $target.text this.get 'content'
      if tag is 'INPUT' 
        $target.attr 'placeholder', this.get 'content'
  
  
  # Return a instance of model  
  Model
    