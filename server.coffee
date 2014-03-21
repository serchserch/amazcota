

express = require 'express'
mongoose = require 'mongoose'
_ = require 'underscore'


http = require 'http'
path = require 'path'

fs = require 'fs'


app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views') 


app.use express.logger 'dev'
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use express.bodyParser()


app.use express.cookieParser 'wololo'
app.use express.session secret: 'wololo'

app.use app.router
app.use express.static path.join(__dirname, 'public')


if 'development' == app.get 'env'
  app.use express.errorHandler()


#
# Secure
mongodbuser = ''
mongodbpass = ''
mongodbdaba = ''
mongodbuser = 'serchserch'
mongodbpass = 'serchserch'
mongodbdaba = 'amazcota'

#
# Data Base connection
#
mongoose.connect 'mongodb://'+mongodbuser+':'+mongodbpass+'@ds039507.mongolab.com:39507/'+mongodbdaba



#
# DB Models
#

LangSchema = mongoose.Schema 
  target: String
  namespace: String
  langs:[
    lang: String
    content: String
  ]


Lang = mongoose.model 'Lang', LangSchema



app.get '/img', (req, res)->
  html = '<form method="post" action="imgp" enctype="multipart/form-data">'
  html += '<p>Title: <input type="text" name="title" /></p>'
  html += '<p>Image: <input type="file" name="image" /></p>'
  html += '<p><input type="submit" value="Upload" /></p>'
  html += '</form>'
    
  res.send html
  return


#
#
#
app.post '/imgp', (req, res)->
  
  console.log __dirname
  fs.readFile req.files.image.path, (err, data)->
    newPath = __dirname + '/img/fullsize/' + req.files.image.name
    pathThu = __dirname + '/img/thumbs/' + req.files.image.name
    

  
    
    fs.writeFile newPath, data, (err)->
      res.redirect '/img/fullsize/' + req.files.image.name
      
      return
    return
  
    
  return



#
#
#
app.get '/img/fullsize/:file', (req, res)->
  
  img = fs.readFileSync __dirname + '/img/fullsize/' + req.params.file
  
  

  res.writeHead 200, 'Content-Type' : 'image/jpg'
  res.end img, 'binary'
  return


  

#
# VISTAS
#

  
#  
# Main  
app.get '/', (req, res)->
  res.sendfile 'views/index.html'
  return



#
# Lang request
app.get '/lang', (req, res)->
   
  
  if req.query.namespace? and req.query.lang?
  
    namespace = req.query.namespace 
    languaje = req.query.lang 
    
    if languaje in ['es_MX', 'en_US', 'pt_BR']
      languaje = languaje
    else
      languaje = 'es_MX'
    
    
    Lang.find 
      'namespace' : req.query.namespace 
    ,
      (err, Langs)->
        #console.log Langs
        #res.send Langs
        
        
        if err
          console.error err 
          return null
        
        NewLang = []
        
        _.each Langs, (val, key)->
          NewLang.push
            _id: val._id
            target: val.target
            namespace: val.namespace
            content: _.findWhere(val.langs , lang: languaje).content
            lang: languaje
          return
  
        res.send NewLang
        return
  else
    res.send error: 'error'
  
  return
  



#
# Create http Server
#
server = http.createServer(app).listen app.get('port'), ->
  console.log 'Amazcota esta escuchando ' + app.get 'port'
  return