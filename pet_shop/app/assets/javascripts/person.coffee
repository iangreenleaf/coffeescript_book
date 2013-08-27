class window.Person
  constructor: (@name) ->

  possessiveName: ->
    if @name[@name.length - 1] in ['s', 'x', 'z']
      "#{@name}'"
    else
      "#{@name}'s"
