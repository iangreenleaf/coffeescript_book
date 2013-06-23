class window.PetView extends View
  constructor: (@pet) ->

  formattedDescription: ->
    "<h2>#{@pet.name}</h2>" +
      "<h3 class='breed'>#{@pet.breed} " +
      "(#{@pet.age ? "??"} years old)</h3>" +
      @imageTag(@pet.image) +
      "<p class='description'>#{@pet.description}</p>"

  formattedName: (showBehavior) ->
    result = @pet.name
    if showBehavior
      [sound, action] = @pet.behaviors()
      [behavior, cssClass] = if sound?
        ["#{sound}!", "sound"]
      else
        [action, "action"]

      result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
    result

  formattedLink: (i, showBehavior=true) ->
    "<a href='#' onclick='selectPet(#{i}, this)'>" +
      "#{@formattedName showBehavior}</a>"

