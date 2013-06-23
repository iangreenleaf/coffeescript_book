class window.PetView extends View
  constructor: (@pet) ->

  formattedDescription: ->
    "<h2>#{@pet.name}</h2>" +
      "<h3 class='breed'>#{@pet.breed} " +
      "(#{@pet.age ? "??"} years old)</h3>" +
      @imageTag(@pet.image) +
      "<p class='description'>#{@pet.description}</p>" +
      "<div id='additional_info' class='more'></div>"

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

  renderExtraContent: ->
    window.renderExtraContentCallback = (response) =>
      if response.Abstract
        @renderToElement "additional_info",
          "<p>#{response.Abstract} (" +
          "<a href='#{response.AbstractURL}'>#{response.AbstractSource}</a>" +
          ", powered by <a href='https://duckduckgo.com'>DuckDuckGo</a>" +
          ")</p>"
    query = @pet.breed.replace " ", "+"
    url = "https://api.duckduckgo.com/?q=#{query}&format=json&t=CoffeeScriptBook"
    s = document.createElement "script"
    s.src = "#{url}&callback=renderExtraContentCallback"
    document.body.appendChild s
