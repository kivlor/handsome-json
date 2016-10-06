format = require './format'
fs = require 'fs'

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

# grab file contents
try
  json = fs.readFileSync process.argv[2], 'utf8'
catch error
  console.log "Error: #{process.argv[2]} isn't readable"
  process.exit 1

# try format content
try
  formatted = format json
catch error
  console.log "Error: #{error.message}"
  process.exit 1

# log and exit
console.log formatted
process.exit()