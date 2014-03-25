# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
],

($, _, Backbone)->
  
  Model = Backbone.Model.extend
  
    urlRoot: '/pet'  
    
    
    #
    #
    #
    initialize: ()->
      return
    
    
    
    
 
  
  
  # Return a instance of model 
  Model
    