
# Import necessary libraries
define [
  'jquery',
  'underscore',
  'backbone',
  'models/PetModel'
],

($, _, Backbone, PetModel)->
  
  Collection = Backbone.Collection.extend
    
    model: PetModel
    requrl: ''
    
    url: ()->
      return this.requrl
    
    #
    #
    #
    initialize: (model, options)->
      
      this.requrl = this.selectreurl options.requrl
      
      return
    
    #
    #
    #  
    selectreurl: (requrl)->
      switch requrl
        when 'popular'
        then return '/pets?popular=true'
        when 'lost'
        then return '/pets?lost=true'
      return
      
  # Return
  Collection