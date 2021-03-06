

express = require 'express'
mongoose = require 'mongoose'

http = require 'http'
path = require 'path'

auth = require './auth'


# 
# Routes
SplashRoute = require './routes/SplashRoute'
LangRoute = require './routes/LangRoute'
PetRoute = require './routes/PetRoute'
CloudinaryRoute = require './routes/CloudinaryRoute'


TestRoute = require './routes/TestRoute'


app = express()

console.log('asdfasd')


#
# Config app
app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views') 

app.use express.logger 'dev'
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()

app.use express.cookieParser auth.secrets.cookie
app.use express.session secret: auth.secrets.session

app.use app.router
app.use express.static path.join(__dirname, 'public')





if 'development' == app.get 'env'
  app.use express.errorHandler()




#
# Secure
#
mongodbuser = auth.mongodb.mongodbuser
mongodbpass = auth.mongodb.mongodbpass
mongodbdaba = auth.mongodb.mongodbdaba





#
# Data Base connection
#
mongoose.connect 'mongodb://'+mongodbuser+':'+mongodbpass+'@ds039507.mongolab.com:39507/'+mongodbdaba





#############################
###    VIEWS /// ROUTES   ###
#############################

  
#  
# Main  
#app.get '/', SplashRoute.index
app.get '/', SplashRoute.test



#
# Lang request
app.get '/lang', LangRoute.get
  

#
# Pet
app.get '/pet/:id', PetRoute.getbyId



#
# Get popular pets
app.get '/pets', PetRoute.getPopulars



#
# Insert new pet
app.get '/pet', PetRoute.newPet



#
#
#
app.post '/img/upload', CloudinaryRoute.upload



#
#
#
app.get '/img/fullsize/:file', TestRoute.view


#
#
#
app.post '/imgp', TestRoute.upload




#
# Create http Server
#
server = http.createServer(app).listen app.get('port'), ->
  console.log 'Amazcota esta escuchando ' + app.get 'port'
  return