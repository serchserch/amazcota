
# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone'
],

($, _, Backbone)->
  
  Collection = Backbone.Collection.extend
    

    url: ()->
      return '/lng'
    
    #
    #
    #
    initialize: ()->
      return
    
    #
    #
    #
    parse: (resp, xhr)->
      return resp.result

  
  return Collection