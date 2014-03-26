
fs = require 'fs'

exports.view = (req, res)->
  img = fs.readFileSync __dirname + '/img/fullsize/' + req.params.file
  res.writeHead 200, 'Content-Type' : 'image/jpg'
  res.end img, 'binary'
  return
  


exports.upload = (req, res)->
  fs.readFile req.files.image.path, (err, data)->
    newPath = __dirname + '/img/fullsize/' + req.files.image.name
    pathThu = __dirname + '/img/thumbs/' + req.files.image.name    
    fs.writeFile newPath, data, (err)->
      res.redirect '/img/fullsize/' + req.files.image.name
      
      return
    return
  return