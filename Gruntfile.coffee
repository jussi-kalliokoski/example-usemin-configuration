module.exports = (grunt) ->
  grunt.initConfig
    clean:
      public:
        src: ['public']
    copy:
      public:
        files: [{
          expand: true
          cwd: 'sources'
          src: '**/*'
          dest: 'public'
        }]
    connect:
      server:
        options:
          port: 8080
          base: 'public'
          keepalive: true
    rev:
      options:
        algorithm: 'sha1'
        length: 16
      assets:
        src: ['public/assets/**/*.*']
    useminPrepare: 
      html: 'public/index.html'
    usemin:
      html: 'public/index.html'
      css: 'public/css/app.css'

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-rev')
  grunt.loadNpmTasks('grunt-usemin')

  grunt.registerTask('default', ['clean:public', 'copy:public', 'useminPrepare', 'rev:assets', 'usemin', 'connect'])
