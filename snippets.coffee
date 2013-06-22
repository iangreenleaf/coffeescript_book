#########################
# CoffeeScript Snippets #
#########################

#
# These snippets are used throughout the chapter to  illustrate the
# CoffeeScript syntax being discussed.
#
# They are generally intended to be run one example at a time.
#
# It is probably easiest to run them in a CoffeeScript console, though you
# can compile and run them in a browser if your prefer.

###############################################
# Defining a class, functions, and properties #
###############################################

class Airplane
  takeOff: (eta) ->
    @taxi()
    console.log "#{s}..." for s in [eta..0]
    console.log "Vrrrroooom!"
  taxi: ->
    if Math.random() > 0.5
      console.log "Taxiing..."
  describe: ->
    "A #{@color} plane"
  parkAt: (airport) ->
    airport.store @

plane = new Airplane()
plane.color = "white"

plane.takeOff()
plane.takeOff(7)

console.log plane.describe()

plane2 = new Airplane()
plane2.color = "blue"
console.log plane2.describe()

class Airport
  store: (plane) ->
    @hangar ?= []
    @hangar.push plane

chicago_ohare = new Airport()
plane.parkAt chicago_ohare

##########################################
# Functions outside the class definition #
##########################################

Date::getYearAE = ->
  monthOffset = if @getMonth() < 11 then 1 else 0
  @getFullYear() - 1944 - monthOffset

today = new Date()
console.log "It is the year #{today.getYearAE()} AE"

################
# Constructors #
################

class Train
  constructor: (@numCars, @type="diesel") ->
    @load = 0
    @capacity = @numCars * 100
  describe: ->
    "A #{@type} train with #{@numCars} cars." +
      " Current filled: #{@load}/#{@capacity} tons."

train = new Train(35)
console.log train.describe()
train2 = new Train 20, "steam"
console.log train2.describe()

###################################
# Static functions and properties #
###################################

class Bicycle
  @WHEELS = 2

  constructor: (@color, @size, @frameType, @tireWidth, @handlebarType) ->

  @frameSizeByHeight = (riderHeight) ->
    Math.floor riderHeight * 0.82

  @buildPackageDeal = (color, type, riderHeight) ->
    basics = [color, @frameSizeByHeight(riderHeight)]
    details = switch type
      when "road"
        ["road", "23c", "drop bars"]
      when "commuter"
        ["road", "30c", "flat bars"]
      when "mountain"
        ["mountain", "2in", "flat bars"]
    args = basics.concat details
    new Bicycle(args...)

for h in [60, 68, 72]
  console.log "A #{h}\" rider needs a size " +
    "#{Bicycle.frameSizeByHeight h} bike."

Bicycle.buildPackageDeal "blue", "commuter", 66

console.log "Bikes have #{Bicycle.WHEELS} wheels."

###############
# Inheritance #
###############

class Automobile
  honk: ->
    console.log "Beep!"
  radio: (volume=0) ->
    console.log "Radio at #{volume}."

class Hatchback extends Automobile
  carAlarm: ->
    @honk()
    @honk()
    @honk()

myCar = new Hatchback()
myCar.honk()
myCar.carAlarm()

class Truck extends Automobile
  honk: ->
    console.log "BRAAAAAP"
  radio: (volume) ->
    super volume + 2

truck = new Truck
truck.radio 9

class PoliceCar extends Automobile
  honk: ->
    super
    console.log "Wee-oo wee-oo wee-oo!"

police = new PoliceCar()
police.honk()
