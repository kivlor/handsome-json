EventEmitter = require 'events'
format = require './format'
fs = require 'fs'

# create an instance of EventEmitter
eventEmitter = new EventEmitter

# once the format-json event is emited
eventEmitter.once 'format-json', (json) ->
  # try format
  try
    formatted = format json
  catch error
    console.log "Error: #{error.message}"
    process.exit 1

  # log and exit
  console.log formatted
  process.exit()

# if being run in a TTY context use file argument
if process.stdin.isTTY is true
  
  # check we have a file to format
  if process.argv[2] is undefined
    console.log "Useage: #{process.argv[1]} path/to/file.json"
    process.exit()

  # check if file is readable
  try
    fs.accessSync process.argv[2], fs.F_OK
  catch error
    console.log "Error: #{process.argv[2]} doesn't exist OR isn't readable"
    process.exit 1

  # read file contents
  fs.readFile process.argv[2], 'utf8', (err, data) ->
    if err
      console.log "Error: #{process.argv[2]} isn't readable"
      process.exit 1

    # emit event to format json
    eventEmitter.emit 'format-json', data

# otherwise read from stdin
else
  # set data to an empty string
  data = ''

  # set stdin encoding to  utf8
  process.stdin.setEncoding 'utf8'

  # on stdin readable
  process.stdin.on 'readable', () ->
    # grab chunk and append to data
    chunk = process.stdin.read()
    unless chunk is null then data = "#{data}#{chunk}"

  # on stdin end
  process.stdin.on 'end', () ->
    # emit event to format json
    eventEmitter.emit 'format-json', data