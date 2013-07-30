###
grunt-coffee-redux

Copyright (c) 2013 Moritz Heuser, contributors
Licensed under the MIT license.
###

module.exports = (grunt)->
  
  grunt.registerMultiTask 'emberscript', 'Compile EmberScript files',()->
    em = require 'ember-script'
    path = require 'path'
    write = (x)->
      grunt.file.write x.fileName, x.content
      grunt.log.writeln "File '#{x.fileName}' created."

    options = @options
      bare: no
      sourceMap: no

    if options.basePath or options.flatten 
      grunt.fail.warn 'experimental destination wildcards are no longer supported. please refer to readme.'
   
    grunt.verbose.writeflags options, 'Options'
    
    for targetFile in @files
      cs =
        content: ""
        fileName: "#{targetFile.dest}.em"
      js =
        content: ""
        fileName: targetFile.dest
      map =
        content: ""
        fileName: "#{targetFile.dest}map.json"

      #concat all cs, see: https://github.com/jashkenas/coffee-script/pull/1820#issuecomment-5048826
      for sourceFile in targetFile.src
        if grunt.file.exists sourceFile
          #parse all files before the concat to point to errors if some
          csSource = grunt.file.read sourceFile
          try
            em.parse csSource
          catch e
            grunt.log.error "Error in file '#{sourceFile}':\n#{e}"
          cs.content += "#{csSource}#{grunt.util.linefeed}"
        else
          grunt.log.warn "Source file '#{sourceFile}' not found. File skipped."
      
      cs.ast = em.parse cs.content,
        bare: options.bare
        raw: options.raw or options.sourceMap
      js.ast = em.compile cs.ast,
        bare: options.bare
      js.content = em.js js.ast

      if options.sourceMap
        map.content = em.sourceMap js.ast, path.basename cs.fileName
        js.content += "#{grunt.util.linefeed}//@ sourceMappingURL=#{path.basename map.fileName}"
        write x for x in [cs, map]

      write js

