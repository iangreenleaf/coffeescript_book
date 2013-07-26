#= require view
class window.PetView extends View
  constructor: (@pet) ->

  formattedDescription: ->
    "<h2>#{@pet.name}</h2>" +
      "<h3 class='breed'>#{@pet.breed} " +
      "(#{@pet.age ? "??"} years old)</h3>" +
      @imageTag(@pet.image) +
      "<p class='description'>#{@pet.description}</p>" +
      "<div id='additional_info' class='more'></div>" +
      "<div id='extra_links' class='more'></div>"

  formattedName: (options={}) ->
    result = @pet.name

    if options.showThumbnail
      result = @imageTag(@pet.image, size: "thumb") + result

    if options.showBehavior
      [sound, action] = @pet.behaviors()
      [behavior, cssClass] = if sound?
        ["#{sound}!", "sound"]
      else if action?
        [action, "action"]
      else
        ["", ""]

      result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
    result

  formattedLink: (i, options={}) ->
    "<a href='#' onclick='selectPet(#{i}, this)'>" +
      "#{@formattedName options}</a>"

  renderExtraContent: ->
    @pet.fetchBreedInfo =>
      if @pet.breedInfo?
        @renderToElement "additional_info",
          "<p>#{@pet.breedInfo.description} (" +
          "<a href='#{@pet.breedInfo.url}'>#{@pet.breedInfo.source}</a>" +
          ", powered by <a href='https://duckduckgo.com'>DuckDuckGo</a>" +
          ")</p>"
      if @pet.extraLinks?
        output = "Learn more: <ul>"
        for topic, url of @pet.extraLinks
          output += "<li><a href='#{url}'>#{topic}</a></li>"
        output += "</ul>"
        @renderToElement "extra_links", output
