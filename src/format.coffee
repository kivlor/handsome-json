render = (element, last = no, name = null, depth = 0) ->
  # start with an empty string and create a depth indent
  rendered = ''
  indent = '  '.repeat depth

  # add name (object key) and indent if set
  unless name is null
    rendered += "#{indent}\"#{name}\": "
  # or just the indent
  else
    rendered += "#{indent}"

  # check for array first as they match both array and object
  if element instanceof Array
    # add open array
    rendered += "[\n"
    
    # for each array element
    i = 0
    l = no
    
    for value in element
      # check if last
      i += 1
      if i is element.length then l = yes

      # render and add
      rendered += render value, l, null, depth+1

    # add indent and close array
    rendered += "#{indent}]"

  # next check for Object
  else if element instanceof Object
    # add open object
    rendered += "{\n"
    
    # for each object element
    i = 0
    l = no

    for key, value of element
      # check if last
      i += 1
      if i is Object.keys(element).length then l = yes

      # render and add
      rendered += render value, l, key, depth+1
    
    # add indent and close object
    rendered += "#{indent}}"

  # finally catch anything else
  else 
    # check for string using typeof
    if typeof element is 'string'
      rendered += "\"#{element}\""

    # check for bool using typeof
    else if typeof element is 'bool'
      rendered += if element is true then 'true' else 'false'

    # catch anything else (number, float, etc.)
    else
      rendered += "#{element}"
  
  # add a comma and newline unless we're at the last element
  unless last
    rendered += ",\n"
  # or just the newline
  else
    rendered += "\n"

  # returned the rendered string
  rendered    

format = (json) ->
  # try parse the json
  try
    parsed = JSON.parse json
  catch error
    return error
  
  # return render
  render(parsed, yes).trim()

module.exports = format