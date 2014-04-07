require.config
  
  paths:
    # Librerias basicas para el funcionamiento del sistema 
    # core
    jquery: 'libs/jquery.min'
    underscore: 'libs/underscore-min'
    backbone: 'libs/backbone-min'
    text: 'libs/require-text'
    handlebars: 'libs/handlebars.min'
    # Librerías extras 
    facebook: '//connect.facebook.net/en_US/all'
    #filtrr2: 'libs/filtrr2/filtrr2-0.6.3.min'
    #facebook: 'libs/facebook/facebook'
    templates: '../templates'
  shim:
    
    backbone:
      deps: [
        'underscore', 
        'jquery'
        ]
      exports: 'Backbone'
      
    underscore:
      exports: '_'
    
    facebook:
      exports: 'FB'
      
    filtrr2:
      deps:[
        'jquery'
      ]
      exports: 'Filtrr2'
    
    handlebars:
      exports: 'Handlebars'
        



require ['app'], 
  (App)->
    App.initialize()
 