shop = {
  owner: { name: "Ian" }
  animals: [
    { name: "Kelsey", type: "dog" }
    { name: "Sgt. Snuffles", type: "dog" }
    { name: "Chomps", type: "rabbit" }
    { name: "Flops", type: "rabbit" }
    { name: "Bopper", type: "rabbit" }
    { name: "Chairman Meow", type: "cat" }
    { name: "Jacques", type: "cat" }
    { name: "Chupa", type: "cat" }
    { name: "Alfred", type: "horse" }
  ]
}

nameElement = document.getElementById("owner_name")
nameElement.innerHTML = shop.owner.name
document.title = shop.owner.name + "'s Pet Shop"

petOutput = for pet in shop.animals
  "<li>" + pet.name + "</li>"

availablePets = document.getElementById("available_pets")
availablePets.innerHTML = petOutput.join ""
