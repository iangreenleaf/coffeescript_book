shop = {
  owner: new Person "Ian"
  animals: Animal.loadSeedData()
}

nameElement = document.getElementById("owner_name")
nameElement.innerHTML = shop.owner.possessiveName()
document.title = "#{shop.owner.possessiveName()} Pet Shop"

formatPetDescription = (pet) ->
  "<h2>#{pet.name}</h2>" +
    "<h3 class='breed'>#{pet.breed} " +
    "(#{pet.age ? "??"} years old)</h3>" +
    imageTag(pet.image) +
    "<p class='description'>#{pet.description}</p>"

imageTag = (filename) ->
  if filename?
    "<img src='images/#{filename}' />"
  else
    ""

window.selectPet = (petIndex, element) ->
  pet = shop.animals[petIndex]
  petInfo = document.getElementById "pet_information"
  petInfo.innerHTML = formatPetDescription pet
  for link in document.querySelectorAll("#available_pets a")
    link.className = ""
  element.className = "selected"

formatPetName = (pet, showBehavior) ->
  result = pet.name
  if showBehavior
    [sound, action] = pet.behaviors()
    [behavior, cssClass] = if sound?
      ["#{sound}!", "sound"]
    else
      [action, "action"]

    result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
  result

formatPetLink = (pet, i, showBehavior=true) ->
  "<a href='#' onclick='selectPet(#{i}, this)'>" +
    "#{formatPetName pet, showBehavior}</a>"

window.displayPetList = (filter="All") ->
  petOutput = for pet, i in shop.animals when filter is "All" or filter.toLowerCase() is pet.type
    "<li>#{formatPetLink pet, i}</li>"

  availablePets = document.getElementById("available_pets")
  availablePets.innerHTML = petOutput.join ""

window.displayPetList()

filteringOutput = for type in ["All", "Dog", "Cat", "Rabbit", "Horse"]
  "<li><a href='#' onclick='displayPetList(\"#{type}\")'>#{type}</a></li>"

filteringOpts = document.getElementById("filtering_opts")
filteringOpts.innerHTML = filteringOutput.join ""

displayFeatured = (featuredPets...) ->
  chosenPetIndex = Math.floor Math.random() * featuredPets.length
  chosenPetName = featuredPets[chosenPetIndex]
  for pet, i in shop.animals when pet.name is chosenPetName
    [chosenPet, fullListIndex] = [pet, i]
  featured = document.getElementById("featured")
  featured.innerHTML = "<span class='title'>Featured Pet</span>" +
    formatPetLink chosenPet, fullListIndex, false

displayFeatured "Chupa", "Kelsey", "Flops"
