
# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
],


($, _, Backbone, Facebook)->
  
  Model = Backbone.Model.extend
    
    # Define url to request http
    urlRoot: '/theurl'
    
    #
    #
    #
    initialize: ()->
      return
    
  
  # Return a instance of model  
  new Model();
    