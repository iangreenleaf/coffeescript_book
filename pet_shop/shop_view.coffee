class window.ShopView
  constructor: (@owner, @mainContent) ->

  render: ->
    nameElement = document.getElementById("owner_name")
    nameElement.innerHTML = @owner.possessiveName()
    document.title = "#{@owner.possessiveName()} Pet Shop"
    @mainContent.render()
