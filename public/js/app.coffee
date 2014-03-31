
# Rutas necesarias para iniciar la aplicación
define [
  'jquery',
  'underscore',
  'backbone',
  'router',
  'models/SessionModel',
  'collections/LangCollection'
],

($, _, Backbone, Router, SessionModel, LangCollection) ->

  initialize = ()->
    
    Langs = new LangCollection

    Languajes = ['en_US', 'es_MX', 'pt_BR']
    Random = Math.floor Math.random() * 3
    Random = 2
                    
    console.log Random

    pre()
    
    # Auth
    SessionModel.IsLogin ()->
      
      # Load languajes
      Langs.LoadDefault Languajes[Random], ()->
        Router.initialize SessionModel, Langs  
        events()         
      return       
      
    return
  
  
  
  pre = ()->
    $menuicon = $('#over').find('nav').find('ul').find('li:nth-child(1)').find('i')
    _template = '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"'
    _template += 'width="100%" height="100%" viewBox="0 0 25 25" enable-background="new 0 0 25 25" xml:space="preserve">'
    _template += '<circle fill="none" stroke="#FFF" stroke-width="0.7" stroke-miterlimit="10" cx="12.5" cy="12.276" r="11.564"/>'
    _template += '<circle fill="none" stroke="#FFF" stroke-width="0.7" stroke-miterlimit="10" cx="12.5" cy="12.276" r="8.72"/>'
    _template += '</svg>'
    $menuicon.html(_template)
  
  
  events = ()->
    $over = $('#over')
    $ulnav = $over.find('header').find('nav').find('ul')
    
    $ulnav.on 'click', 'li:nth-child(1)', (e)->
      $over.toggleClass 'minOver'
      $('body').toggleClass 'bodyNoScroll'
      
    $('#Change').on 'click', (e)->
      e.preventDefault()
      Random++             
      Random = 0 if Random > 2
      Langs.ChangeLang Languajes[Random]   
    
  
  initialize: initialize
  
