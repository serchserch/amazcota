

_ = require 'underscore'
PetModel = require '../models/PetModel'


#
#
#
exports.getbyId = (req, res)->
  PetModel.findOne '_id': req.params.id , (err, Pet)->
    return res.send err: 'get by id fail' if err
    res.send Pet
    return  
  return
  
  
#
#
#
exports.getPopulars = (req, res)->
  
  #unless req.query.popular 
    
  if req.query.popular  
    Populars req, res
    return
  
  if req.query.lost
    Lost req, res
    return
    
  return res.send err: 'get pets fail' 


Populars = (req, res)->
  PetModel.find().limit(8).exec (err,Pets)->
    res.send Pets
    return


Lost = (req, res)->
  PetModel.find().limit(5).exec (err,Pets)->
    res.send Pets
    return





#
#
#
exports.newPet = (req, res)->

  Chocolate = new PetModel
      name: 'Chocolate-' + ( Math.floor (Math.random()*1000)+1 )
      birthday: new Date().toISOString()
      specie: 'Dog'
      breed: 'mestizo'
      size: 'big'
      colors: [
        color: 'brown'
        percent: 90
      ,
        color: 'white'
        percent: 10
      ]  
      details: '?Deatils::' + ( Math.random() * 10000 )
      
      profilephoto: 'http://lorempixel.com/400/200/'
      photos:[
        photourl: 'http://lorempixel.com/400/200/'
      ]
      
      # History of status adoption, lost, found 
      status:[
        _statusid: '54d512165411as2asd145' 
      ]
      
      # Medical status 
      medical:
        vaccines:[
          vaccine: 'Rabia'
          dategiven: new Date().toISOString()
          nextdosedate: new Date().toISOString()
          details: 'Si puesta'
        ]
        sterilized: true
        dewormed: false 
      # History of owners
      bestfriends: [
        _idhuman: '987d918374s12l'
      ]
      # Current owner
      currentbestfriend: '98132k29s7o92347'
  
  
  Chocolate.save (err)->
    #console.log 'oops'+ err if err
    return res.send err: 'get by new pet' if err
    
    res.send Chocolate
    
    return
    
  return