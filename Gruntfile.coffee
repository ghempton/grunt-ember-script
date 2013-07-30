###
grunt-ember-script

Copyright (c) 2013 Gordon L. Hempton, contributors
Licensed under the MIT license.
###

module.exports = (grunt)->

  grunt.initConfig
    clean:
      tests: [
        'tmp'
      ]
    emberscript:
      options:
        bare: false
        sourceMap: true
      compile:
        files:
          'tmp/helloworld.js': [
            'test/fixtures/hello.em'
            'test/fixtures/world.em'
          ]
          #ToDo: Write a test for a failed compilation
          #'tmp/shouldNotBeCreated.js': 'test/fixtures/invalid.coffee'
    nodeunit:
      tests: [
        'test/*_test.coffee'
      ]

  grunt.loadTasks 'tasks'

  grunt.loadNpmTasks task for task in [
    'grunt-contrib-clean'
    'grunt-contrib-nodeunit'
    'grunt-contrib-internal'
  ]

  grunt.registerTask 'test', ['clean', 'emberscript', 'nodeunit']
  grunt.registerTask 'default', ['test', 'build-contrib']

