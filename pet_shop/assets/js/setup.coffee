#= require person
#= require animal
#= require pet_view
#= require pet_list_view
#= require shop_view
shop = {
  owner: new Person "Ian"
  featured: [ "Chupa", "Kelsey", "Flops" ]
}

Animal.loadSeedData (animals) ->
  petViews = (new PetView pet for pet in animals)
  petListView = new PetListView petViews, shop.featured
  mainView = new ShopView shop.owner, petListView
  mainView.render()
