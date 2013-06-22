shop = {
  owner: { name: "Ian" }
}
nameElement = document.getElementById("owner_name")
nameElement.innerHTML = shop.owner.name
document.title = shop.owner.name + "'s Pet Shop"
