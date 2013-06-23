class window.PetListView extends View
  constructor: (@views, featuredPets) ->
    @featured = featuredPets

  render: ->
    @renderList()
    @renderFilteringBar()
    @renderFeatured()
    window.displayPetList = (filterType) =>
      @renderList(filterType)
    window.selectPet = (index, element) =>
      @selectPet(index, element)

  renderList: (filter) ->
    petOutput = for view, i in @views when view.pet.matchesFilter filter
      "<li>#{view.formattedLink i, showBehavior: true}</li>"
    @renderToElement "available_pets", petOutput.join ""

  selectPet: (petIndex, element) ->
    petView = @views[petIndex]
    @renderToElement "pet_information", petView.formattedDescription()
    petView.renderExtraContent()
    for link in document.querySelectorAll("#available_pets a")
      link.className = ""
    element.className = "selected"

  renderFeatured: ->
    return unless @featured?
    @chosenFeatured ?= do =>
      chosenPetIndex = Math.floor Math.random() * @featured.length
      chosenPetName = @featured[chosenPetIndex]
      for view, i in @views when view.pet.name is chosenPetName
        return [view, i]
    [chosenPetView, fullListIndex] = @chosenFeatured
    @renderToElement "featured",
      "<span class='title'>Featured Pet</span>" +
      chosenPetView.formattedLink fullListIndex, showThumbnail: true

  renderFilteringBar: ->
    filteringOutput = for type in Animal.CATEGORIES
      "<li><a href='#' onclick='displayPetList(\"#{type}\")'>#{type}</a></li>"

    @renderToElement "filtering_opts", filteringOutput.join ""
