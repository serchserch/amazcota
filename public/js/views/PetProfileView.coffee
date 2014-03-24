

# Import necessary libraries
define [
  'jquery'
  'underscore'
  'backbone'
  'filtrr2'
  'text!templates/PetProfileTemplate.html'
],


($, _, Backbone, Filtrr2, PetProfileTemplate)->
  
  
  View = Backbone.View.extend
  
    el: '#container'
       
    #
    #
    #
    events:
      'click #uploader': 'resize'
      'click form button': 'append'
       
       
    #
    # View constructor
    #
    initialize: (Routes, Session)->
      
     
      # Compile template  
      CompiledTemplate = _.template PetProfileTemplate 
      
      
      # Append Template
      this.$el.html CompiledTemplate    
      
         
      return
    
    #
    #
    #
    append: (e)->
      e.preventDefault()
      # Get image input
      selectedFile = $(e.currentTarget.form).find('input')[0].files[0];
      reader = new FileReader();
      
      # Target to insert new image
      $targetimg = $('#targetimg')
      
      
      # File type detection
      unless selectedFile.type in ['image/jpeg', 'image/png', 'image/gif']
        alert 'tipo de archivo no permitido'
        return null
      
      # Image size limit
      if selectedFile.size > 3000000
        alert 'imagen muy pesada'
        return null
      

      # envent when de file is loaded
      reader.onload = (e)->
          
        # Append image on target
        $targetimg.attr 'src', e.target.result
        
        # Apply effects 
        Filtrr2('#targetimg', ()->
          this.brighten(40)
          .saturate(50)
          .render()
          
          # Canvas target
          canvasfiltrr2 = $('#filtrr2-targetimg')[0];
          
          # Data tu send
          dataurl = canvasfiltrr2.toDataURL 'image/jpg'
          
          #
          # Rutine to upload image
          #
          
          return 
        ).save()
        
        return
      
      # Reder image as urle
      reader.readAsDataURL selectedFile
      
      return
    
    
    #
    #
    #
    resize: (e)->
      e.preventDefault()
      canvas = $(e.target)[0]
      context = canvas.getContext '2d'
      x = 100
      y = 30
      width = 100
      height = 100
      $imageObj = $('<img>')
      $imageObj.attr 'crossorigin', 'anonymous'
      
      $imageObj.load ()->
        context.drawImage imageObj, x, y, width, height
        dataurl = canvas.toDataURL 'image/jpg'
        console.log dataurl
        
      $imageObj.attr 'src', 'http://newknd.com/photos/RachelBilson1568294334.jpg'
      
      
