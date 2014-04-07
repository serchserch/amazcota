
_prodPATH = '../../_prod/amazcota/'

module.exports = (grunt)->
  grunt.initConfig
    
    coffee:
      server:
        src: ['server.coffee']
        dest: '../../_prod/amazcota/server.js'
      
      all:
        expand: true
        cwd: './'
        src: ['**/*.coffee']
        dest: _prodPATH
        ext: '.js'
        options:
          bare: true
          
      # clientside:
        # expand: true
        # cwd: 'public/js/'
        # src: ['**/*.coffee']
        # dest: '../../_prod/amazcota/public/js/'
        # ext: '.js'    
  
    less:
      development:
        options:
          compress: true
          optimization: 2
        files:
          _prodPATH + 'public/css/style.css': 'less/style.less'
    
    jade:
      compile:
        options:
          client: false
          pretty: false
        files:[
          expand: true
          cwd: './views/'
          src: '**/*.jade'
          dest: _prodPATH + 'views/'
          ext: '.html'
        ,
          expand: true
          cwd: './public/templates/'
          src: '**/*.jade'
          dest: _prodPATH + 'public/templates/'
          ext: '.html'          
        ]
    
    copy:
      main:
        files:[
          expand: true
          cwd:'./public/js/libs/'
          src:['**/*.js']
          dest: _prodPATH + 'public/js/libs/'
          ext: '.js'
        ]
            

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  
  grunt.registerTask 'default' , ['coffee:server', 'less']
