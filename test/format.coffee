format = require '../src/format'
chai = require 'chai'

expect = chai.expect

describe 'json-formatter', ->
  describe 'when format is called', ->
    describe 'with a valid JSON string', ->
      it 'should return a formated string', ->
        json = '{"foo": [42, 3.1415], "bar": {"baz": "quax"}, "baz": true}'
        result = format json
        console.log result
        expect(result).to.be.a 'string'

    describe 'with an invalid JSON string', ->
      it 'should return an error', ->
        result = format '{"hello world"}'
        expect(result).to.be.an 'error'