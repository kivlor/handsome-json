### Handsome JSON

Make your JSON strings handsome.

![https://travis-ci.org/kivlor/handsome-json.svg?branch=master](https://travis-ci.org/kivlor/handsome-json.svg?branch=master)

#### Usage

Honestly, just use this one liner in your code:

```
console.log(JSON.stringify(JSON.parse('{"foo":"bar"}'), null, 2));
```

Otherwise, install via NPM:

```
npm install --save handsome-json
```

Then include in your project and format away:

```
var format = require('hansome-json');

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
