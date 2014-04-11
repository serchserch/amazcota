
_prodPATH = '../../_prod/amazcota/'

module.exports = (grunt)->
  grunt.initConfig
    
    coffee: 
      # server: 
        # src:  ['server.coffee']
        # dest:  '../../_prod/amazcota/server.js'
      
      all: 
        expand:  true
        cwd:  './'
        src:  ['**/*.coffee']
        dest:  _prodPATH
        ext:  '.js'
        options: 
          bare:  true
          compress:  true
          
      # clientside: 
        # expand:  true
        # cwd:  'public/js/'
        # src:  ['**/*.coffee']
        # dest:  '../../_prod/amazcota/public/js/'
        # ext:  '.js'    
  
  
  
    #
    #
    # 
    less: 
      development: 
        options: 
          compress:  true
          optimization:  2
        files: 
          _prodPATH + 'public/css/style.css':  'less/style.less'
          
          
    #
    #
    #
    jade: 
      compile: 
        options: 
          client:  false
          pretty:  true
        files: [
          expand:  true
          cwd:  './views/'
          src:  '**/*.jade'
          dest:  _prodPATH + 'views/'
          ext:  '.html'
        ,
          expand:  true
          cwd:  './public/templates/'
          src:  '**/*.jade'
          dest:  _prodPATH + 'public/templates/'
          ext:  '.hbs'          
        ]
        
        
        
    #
    #
    #
    copy: 
      main: 
        files: [
          expand:  true
          cwd: './public/js/libs/'
          src: ['**/*.*']
          dest:  _prodPATH + 'public/js/libs/'
          #ext:  '.min.js'
        ]
    
    
    #
    #
    #
    uglify: 
      all: 
        options: 
          mangle:  false
          compress: 
            drop_console:  true
        files: [
          expand:  true
          cwd:  _prodPATH
          src:  ['**/*.js', '!**node_modules/**', '!public/js/libs/*.js']
          dest:  _prodPATH 
          ext:  '.js'
        ]
          
          
            

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  
  grunt.registerTask 'default' , ['coffee', 'less']
