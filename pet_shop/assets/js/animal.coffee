#= require reqwest
class window.Animal
  @CATEGORIES = ["All", "Dog", "Cat", "Rabbit", "Horse"]

  behaviors: ->
    switch @type
      when "cat" then ["meow", null]
      when "dog" then ["bark", "wag"]
      when "rabbit" then [null, "hop hop"]
      when "bird" then ["chirp", "flap"]
      when "horse", "donkey"
        ["neigh", null]
      else
        [null, null]

  matchesFilter: (criteria='All') ->
    criteria is "All" or criteria.toLowerCase() is @type

  fetchBreedInfo: (callback) ->
    reqwest
      url: "https://api.duckduckgo.com/"
      data: { q: @breed, format: "json", t: "CoffeeScriptBook" }
      type: "jsonp"
      success: (response) =>
        if response.Abstract
          @breedInfo =
            description: response.Abstract
            source: response.AbstractSource
            url: response.AbstractURL
        callback()
        topics = (topic.FirstURL for topic in response.RelatedTopics when topic.FirstURL?)
        @fetchExtraLinks topics, callback

  fetchExtraLinks: (topics, callback) ->
    @extraLinks = {}
    expected = topics.length
    for topic in topics
      do (topic) =>
        reqwest
          url: topic
          data: { format: "json" }
          type: "jsonp"
          success: (response) =>
            if response.Heading
              @extraLinks[response.Heading] = topic
              expected -= 1
              callback() if expected is 0

  @fromHash: (data) ->
    animal = new @
    animal[key] = val for key, val of data
    animal

  @loadSeedData: (callback) ->
    reqwest
      url: "/pets"
      type: "json"
      success: (response) =>
        animals = for animal in response
          @fromHash animal
        callback animals
