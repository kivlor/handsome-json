format = require '../src/format'
chai = require 'chai'

expect = chai.expect

describe 'json-formatter', ->
  describe 'when format is called', ->
    describe 'with a valid JSON string', ->
      it 'it should return a formated string', ->
        result = format '{"foo":[42,3.1415],"bar":{"baz":"quax"},"baz":true}'
        expect(result).to.be.a 'string'

    describe 'with an invalid JSON string', ->
      it 'it should throw an error', ->
        expect(() -> format '{"hello world"}').to.throw Error