class window.Animal
  @CATEGORIES = ["All", "Dog", "Cat", "Rabbit", "Horse"]

  behaviors: ->
    switch @type
      when "cat" then ["meow", null]
      when "dog" then ["bark", "wag"]
      when "rabbit" then [null, "hop hop"]
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
    getExtraLink = (topic, done) =>
      reqwest
        url: topic
        data: { format: "json" }
        type: "jsonp"
        success: (response) =>
          if response.Heading
            @extraLinks[response.Heading] = topic
          done()
    async.each topics, getExtraLink, callback

  @fromHash: (data) ->
    animal = new @
    animal[key] = val for key, val of data
    animal

  @loadSeedData: ->
    animalData = [
      name: "Kelsey"
      type: "dog"
      age: 2
      breed: "Labrador"
      description: "A sweet and loyal dog. Loves to play fetch. Sometimes drinks out of the toilet."
    ,
      name: "Sgt. Snuffles"
      type: "dog"
      breed: "Pug"
      description: "Small in stature, but big in heart, Sgt. Snuffles is never one to back down from a mission."
    ,
      name: "Chomps"
      type: "rabbit"
      breed: "Giant Angora"
      description: "Chomps is usually very good-natured, but he does not take kindly to being mistaken for an ottoman. Come see him in person and you'll understand why that may happen."
    ,
      name: "Flops"
      type: "rabbit"
      age: 4
      breed: "French Lop"
      image: "flops.jpg"
      description: "Enjoys nothing more than a good roll in the grass and a nap in the sun."
    ,
      name: "Bopper"
      type: "rabbit"
      breed: "Checkered Giant"
      description: "The quiet one of the group. Loves celery."
    ,
      name: "Chairman Meow"
      type: "cat"
      breed: "Snowshoe"
      description: "True to his name, Chairman Meow fancies himself in charge."
    ,
      name: "Jacques"
      type: "cat"
      age: 11
      breed: "Manx"
      description: "A happy-go-lucky cat who occasionally finds himself at odds with Chairman Meow over who gets to sit at the top of the cat tree."
    ,
      name: "Chupa"
      type: "cat"
      age: 3
      breed: "Scottish Fold"
      image: "chupa.jpg"
      description: "Chupa always appears perplexed with the world, but don't be fooled. That's just the way his face is shaped."
    ,
      name: "Alfred"
      type: "horse"
      breed: "Breton"
      description: "The resident shop patriarch. Very calm and tolerates the antics of the other animals when they sneak into his pen."
    ]
    for animal in animalData
      @fromHash animal
