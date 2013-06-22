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

############################
# Dealing with null values #
############################

if yeti?
  "I want to believe"

animalStatus = (animal) ->
  creatures = { ocelot: true, dodo: false }
  if creatures[animal]?
    if creatures[animal]
      "The #{animal} is alive and well."
    else
      "Oh no! The #{animal} is extinct!"
  else
    "The #{animal} isn't real."

console.log animalStatus("ocelot")
console.log animalStatus("dodo")
console.log animalStatus("unicorn")

trees =
  pine:
    type: "evergreen"
  crabapple:
    type: "deciduous"
    fruit:
      edible: false

if trees.pine.fruit?.edible
  console.log "Mmmm... pine fruit."

if trees.truffula?.fruit?.edible
  console.log "Mmmm... truffula fruit."

alpha =
  lowercase: ["a", "b", "c", "d"]
console.log alpha.lowercase?[2].toUpperCase()
console.log alpha.uppercase?[2].toLowerCase()

extractBugNumber = (line) ->
  line.match(/(issue|bug) #(\d+)/)?[2]

console.log extractBugNumber "This fixes bug #345."
console.log extractBugNumber "No bug number mentioned."

oppositeMath =
  min: Math.max
console.log oppositeMath.min?(3, 2, 5)
console.log oppositeMath.max?(3, 2, 5)

briefcase =
  color: "silver"
briefcase.combination ?= "1234"
briefcase.color ?= "black"
console.log briefcase

sighting = mothMan ? "sandhill crane"
console.log sighting

#############################
# Assigning multiple values #
#############################

[first, second] = ["horse", "cart"]
console.log "Don't put the #{second} before the #{first}."

[x, y] = [22, 15]
hypotenuse = Math.sqrt x*x + y*y

[languageName, prefix] = "CoffeeScript".match /(.*)Script/
console.log "I love the smell of #{prefix} in the morning."

[first, second] = ["cow", "milk"]
# Wait, or is it the other way around?
[first, second] = [second, first]
console.log "Don't put the #{second} before the #{first}."

[drink, [alcohol, mixer]] = ["Screwdriver", ["vodka", "orange juice"]]
console.log "A #{drink} consists of #{alcohol} and #{mixer}."

blackbird = verb: "singing", time: "midnight"
{time} = blackbird
console.log "At #{time}"
{verb: birdBehavior} = blackbird
console.log "It was #{birdBehavior}."

retroGames =
  pacman:
    villains: "ghosts"
    objective: "eat dots"
  spaceInvaders:
    villains: "aliens"
    objective: "shoot aliens"

{pacman: {villains, objective}, spaceInvaders: { villains: otherBadGuys}} = retroGames
console.log "In Pacman the goal was to #{objective}."
console.log "The enemies were #{villains}. At least they weren't #{otherBadGuys}."

boat = { directions: ["port", "starboard"] }
{directions: [left, right]} = boat
console.log "Turn to #{right}!"

directionCommands = [
  {type: "boat", directions: ["port", "starboard"]},
  {type: "dogsled", directions: ["haw", "gee"]}
]
[boatInfo, {directions: [left, right]}] = directionCommands
console.log "#{left}! Mush!"


###############################
# Advanced function arguments #
###############################

formatTemperature = (degrees, scale='K', decimalPlaces=1) ->
  formatted = degrees.toFixed decimalPlaces
  formatted += if scale.toUpperCase() is 'K' then " " else "°"
  formatted + scale.toUpperCase()

console.log formatTemperature(42)
console.log formatTemperature(22.35, "C")
console.log formatTemperature(12.34, "F", 2)
console.log formatTemperature(88.11265, null, 4)

formattedAverageTemperature = (scale, temperatures...) ->
  sum = 0
  sum += t for t in temperatures
  formatTemperature(sum / (temperatures.length), scale)

console.log formattedAverageTemperature("F", 98, 10, 32)

temps = [-10, 44, 80]
console.log formattedAverageTemperature("F", temps...)

fetchSearchResults = (url, searchTerms..., callback) ->
  console.log "Searching #{url} for #{searchTerms.join " "} now."
  asyncRequest url, buildQuery(searchTerms), callback

[race, [splits..., time]] = ["10k", ["13:08", "13:09", "26:17"]]
console.log "The world record for #{race} is #{time}."
console.log "The splits were #{splits.join " and "}."

formattedColdestTemperature = (scale, temperatures...) ->
  minTemp = Math.min temperatures...
  formatTemperature(minTemp, scale)
console.log formattedColdestTemperature "C", 20, -5, 33
