Person = require "person"
Animal = require "animal"
PetView = require "pet_view"
PetListView = require "pet_list_view"
ShopView = require "shop_view"
shop = {
  owner: new Person "Ian"
  animals: Animal.loadSeedData()
  featured: [ "Chupa", "Kelsey", "Flops" ]
}

petViews = (new PetView pet for pet in shop.animals)
petListView = new PetListView petViews, shop.featured
mainView = new ShopView shop.owner, petListView
mainView.render()
