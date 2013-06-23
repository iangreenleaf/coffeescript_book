class Boat
  liftAnchor: (doneCallback) ->
    console.log "Lifting anchor."
    if doneCallback?
      setTimeout doneCallback, 1000
  setSpeed: (speed) ->
    console.log "Adjusting speed to #{speed} knots."
  depart: ->
    @liftAnchor =>
      @setSpeed 10

caravel = new Boat
caravel.depart()
