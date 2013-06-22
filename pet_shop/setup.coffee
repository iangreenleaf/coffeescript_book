shop = {
  owner: { name: "Ian" }
  animals: [
    name: "Kelsey"
    type: "dog"
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
    breed: "French Lop"
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
    breed: "Manx"
    description: "A happy-go-lucky cat who occasionally finds himself at odds with Chairman Meow over who gets to sit at the top of the cat tree."
  ,
    name: "Chupa"
    type: "cat"
    breed: "Scottish Fold"
    description: "Chupa always appears perplexed with the world, but don't be fooled. That's just the way his face is shaped."
  ,
    name: "Alfred"
    type: "horse"
    breed: "Breton"
    description: "The resident shop patriarch. Very calm and tolerates the antics of the other animals when they sneak into his pen."
  ]
}

nameElement = document.getElementById("owner_name")
nameElement.innerHTML = shop.owner.name
document.title = "#{shop.owner.name}'s Pet Shop"

formatPetDescription = (pet) ->
  "<h2>#{pet.name}</h2>" +
    "<h3 class='breed'>#{pet.breed}</h3>" +
    "<p class='description'>#{pet.description}</p>"

window.selectPet = (petIndex, element) ->
  pet = shop.animals[petIndex]
  petInfo = document.getElementById "pet_information"
  petInfo.innerHTML = formatPetDescription pet
  for link in document.querySelectorAll("#available_pets a")
    link.className = ""
  element.className = "selected"

animalSound = (animal) ->
  switch animal.type
    when "cat" then "meow"
    when "dog" then "bark"
    when "horse", "donkey"
      "neigh"
    else "sniff sniff"

formatPetName = (pet) ->
  "#{pet.name} <span class='sound'>#{animalSound pet}!</span>"

petOutput = for pet, i in shop.animals
  "<li><a href='#' onclick='selectPet(#{i}, this)'>#{formatPetName pet}</a></li>"

availablePets = document.getElementById("available_pets")
availablePets.innerHTML = petOutput.join ""
