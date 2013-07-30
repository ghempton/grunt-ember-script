# grunt-ember-script

> Compile EmberScript files.



## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-ember-script --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-ember-script');
```




## Em task
_Run this task with the `grunt em` command._

This plugin provides the [EmberScript](http://emberscript.com) compiler.

### Options

#### bare

Type: `boolean`

Default: `no`

Compile the JavaScript without the top-level function safety wrapper.

#### sourceMap

Type: `boolean`

Default: `no`

Create a source map and a EmberScript file with all concatenated sources in
the same folder as the target JavaScript file. 

The source map will be named like this: `#{targetJsFileName}map.json`, e.g.:
`helloworld.jsmap.json`.

The EmberScript file with all concatenated sources will be named like this:
`#{targetJsFileName}.em`, e.g.: `helloworld.js.em`.


### Example Configuration

```coffee
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
```

This configuration will create following files in the `tmp` folder:

  * `helloworld.js.em`: This is the result of the concatenation of the
  files `hello.em` and `world.em`.
  
  * `helloworld.jsmap.json`: The source map who is pointing to the
  `helloworld.js.em`.

  * 'helloworld.js': Is the to JavaScript compiled version of the
  `helloworld.js.em` file.



## Release History

_(Nothing yet)_


---

Task submitted by [Gordon Hempton](http://codebrief.com)

*This file was generated on Mon Jul 29 2013 23:30:11.*
