class window.PetListView
  constructor: (@views) ->
    # Nothing to do

  render: ->
    @renderList()
    @renderFilteringBar()
    @renderFeatured "Chupa", "Kelsey", "Flops"
    window.listView = @
    window.displayPetList = (filterType) ->
      window.listView.renderList(filterType)
    window.selectPet = (index, element) ->
      window.listView.selectPet(index, element)

  renderList: (filter="All") ->
    petOutput = for view, i in @views when filter is "All" or filter.toLowerCase() is view.pet.type
      "<li>#{view.formattedLink i}</li>"

    availablePets = document.getElementById("available_pets")
    availablePets.innerHTML = petOutput.join ""

  selectPet: (petIndex, element) ->
    petView = @views[petIndex]
    petInfo = document.getElementById "pet_information"
    petInfo.innerHTML = petView.formattedDescription()
    for link in document.querySelectorAll("#available_pets a")
      link.className = ""
    element.className = "selected"

  renderFeatured: (featuredPets...) ->
    chosenPetIndex = Math.floor Math.random() * featuredPets.length
    chosenPetName = featuredPets[chosenPetIndex]
    for view, i in @views when view.pet.name is chosenPetName
      [chosenPetView, fullListIndex] = [view, i]
    featured = document.getElementById("featured")
    featured.innerHTML = "<span class='title'>Featured Pet</span>" +
      chosenPetView.formattedLink fullListIndex, false

  renderFilteringBar: ->
    filteringOutput = for type in ["All", "Dog", "Cat", "Rabbit", "Horse"]
      "<li><a href='#' onclick='displayPetList(\"#{type}\")'>#{type}</a></li>"

    filteringOpts = document.getElementById("filtering_opts")
    filteringOpts.innerHTML = filteringOutput.join ""
