class window.PetView extends View
  constructor: (@pet) ->

  formattedDescription: ->
    "<h2>#{@pet.name}</h2>" +
      "<h3 class='breed'>#{@pet.breed} " +
      "(#{@pet.age ? "??"} years old)</h3>" +
      @imageTag(@pet.image) +
      "<p class='description'>#{@pet.description}</p>"

  formattedName: (options={}) ->
    result = @pet.name

    if options.showThumbnail
      result = @imageTag(@pet.image, size: "thumb") + result

    if options.showBehavior
      [sound, action] = @pet.behaviors()
      [behavior, cssClass] = if sound?
        ["#{sound}!", "sound"]
      else
        [action, "action"]

      result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
    result

  formattedLink: (i, options={}) ->
    "<a href='#' onclick='selectPet(#{i}, this)'>" +
      "#{@formattedName options}</a>"

