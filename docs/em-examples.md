# Example Configuration

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

