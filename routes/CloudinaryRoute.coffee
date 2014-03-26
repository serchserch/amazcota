cloudinary = require 'cloudinary'

cloudinary.config
  cloud_name: 'amazcota'
  api_key: '146194368698915'
  api_secret: 'LW82HMYXjzPARF5yoSOeTirb5z8'


exports.upload = (req, res)->
  cloudinary.uploader.upload 'http://newknd.com/photos/RachelBilson1568294334.jpg', (result)->
    console.log result
    return
  return