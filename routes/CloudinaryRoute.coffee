auth = require '../auth'
cloudinary = require 'cloudinary'

cloudinary.config
  cloud_name: auth.cloudinary.cloud_name
  api_key: auth.cloudinary.api_key
  api_secret: auth.cloudinary.api_secret


exports.upload = (req, res)->
  cloudinary.uploader.upload 'http://newknd.com/photos/RachelBilson1568294334.jpg', (result)->
    console.log result
    return
  return