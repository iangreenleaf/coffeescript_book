#= require person
#= require animal
#= require pet_view
#= require pet_list_view
#= require shop_view
shop = {
  owner: new Person "Ian"
  animals: Animal.loadSeedData()
  featured: [ "Chupa", "Kelsey", "Flops" ]
}

$ ->
  petViews = (new PetView pet for pet in shop.animals)
  petListView = new PetListView petViews, shop.featured
  mainView = new ShopView shop.owner, petListView
  mainView.render()
