### Handsome JSON

![https://travis-ci.org/kivlor/handsome-json.svg?branch=master](https://travis-ci.org/kivlor/handsome-json.svg?branch=master)

Make your JSON strings handsome.

#### Useage

Install via NPM:
```
npm install --save handsome-json
```

Then include in your project and format away:
```
var format = require('hansome-js');

var json = '{"foo":"bar"}';

console.log(format(json));
```

You can also install globally if you're into that:
```
npm install -g handsome-json
```

Then from the command line call handsome like so:
```
handsome path/to/your/unformatted.json
```