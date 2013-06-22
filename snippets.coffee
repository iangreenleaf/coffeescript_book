#########################
# CoffeeScript Snippets #
#########################

#
# These snippets are meant to illustrate various uses of CoffeeScript.
#
# They are generally intended to be run separately so that you can examine
# the results. They are designed to be run in the Node.js environment that is
# available inside a CoffeeScript runtime for simplicity (no browser needed).
#
# If you are running these examples in a CoffeeScript console, the result of
# each snippet will be displayed after you execute it. However, if you are
# running these snippets from a .coffee file, you'll need to print your results
# to output to be able to see them. Usually all you'll need to do is put a
# console.log call in front of the value(s) you want to see, like this:
#
#     console.log x = 1 + 1
#     console.log Math.pow 2, 3
#
#

##########
# Basics #
##########

x = 1 + 1

x = 1\
  + 1

"foo"
  .concat("barbaz")
  .replace("foobar", "fubar")

x = 1; y = 2

x = 1
y = 2
z = x + y

# This is a comment.
"Hello" # This is also a comment

# Most multiline comments simply wrap to the
# next line, each begun with a # and a space.

###
This is a block comment. You can get artistic in here.
<(^^)>
###

#####################
# Calling functions #
#####################

console.log "Hello, planet!"

Math.pow 2, 3

Date.now()

Math.max 2, 3, Math.min 4, 5, 6

# These two calls are equivalent
Math.max(2, 3, Math.min(4, 5, 6))
Math.max 2, 3, Math.min(4, 5, 6)

# These two calls are equivalent
Math.max(2, 3, Math.min(4, 5), 6)
Math.max 2, 3, Math.min(4, 5), 6

if true == true
  console.log "Tautology!"

number = 6
console.log "Let's test our number."
if number > 0
  console.log "Our number is greater than 5"
  if number > 10
    console.log "Our number is greater than 10"
  console.log "Now we're done testing."

######################
# Control structures #
######################

number = -8
if number > 0
  "Positive"
else if number < 0
  "Negative"
else
  "Zero"

day = "Monday"
unless day[0] == "S"
  console.log "This is a weekday."

day = "Monday"
unless day[0] == "S"
  console.log "This is a weekday."
else
  console.log "It's the weekend!"

console.log "Truth achieved!" if true == true

console.log "Universe error!" unless true == true

########################
# Comparison operators #
########################

if 1 < 2 && 3 >= 2
  if false || true
    if !false
      console.log "All is well."

status = "normal"
reactor = "primed"
console.log "All clear" if status is "normal"
console.log "Abort mission" if reactor isnt "primed"

location = "Washington"
hairy = false
blurryPhoto = true
manInApeSuit = false
isBigfoot = location is "Washington" and (hairy or blurryPhoto) and not manInApeSuit

power = true
mute = false
if power is on
  playingMusic = yes if mute is off
else
  playingMusic = no

##########
# Arrays #
##########

languages = [
  "english"
  "spanish"
  "french"
]
console.log languages[1]

singleDigits = [0..9]

countdown = [10..1]

[1..5] == [1, 2, 3, 4, 5]
[1...5] == [1, 2, 3, 4]

start = 0
end = 1000
bigNumbers = [start..end]

#########
# Loops #
#########

animals = ["dog", "cat", "bird"]
for animal in animals
  console.log animal

animals = ["dog", "cat", "bird"]
console.log animal for animal in animals

animals = ["dog", "cat", "bird"]
pluralAnimals = for animal in animals
  animal + "s"

animals = ["dog", "cat", "bird"]
pluralAnimals = (animal + "s" for animal in animals)
console.log pluralAnimals

words = ["dogma", "catastrophe", "doggerel", "hangdog"]
for word in words when word.indexOf("dog") isnt -1
  console.log word

evenNumbers = (n + " is even" for n in [1..100] when n % 2 is 0)

solarSystem = [
  "Mercury"
  "Venus"
  "Earth"
  "Mars"
  "Jupiter"
  "Saturn"
  "Uranus"
  "Neptune"
  "Pluto"
]
for planet, planetIndex in solarSystem when planet isnt "Pluto"
  console.log "Planet #" + (planetIndex+1) + " is " + planet

number = 3
if number in [2, 3, 5, 7, 11, 13]
  console.log number + " is prime!"

planets = [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", ]
console.log "Hooray!" if "Pluto" in planets

###########
# Objects #
###########

author = { name: "Ian", age: 26 }
author.name
author["age"]
author.favoriteLanguage = "CoffeeScript"
author = name: "Ian", age: 26, favoriteLanguage: "CoffeeScript"
authorsBicycle =
  color: "black"
  brand:
    make: "Surly"
    model: "Cross Check"
  fenders: true
  gears: 24

author = name: "Ian", age: 26, favoriteLanguage: "CoffeeScript"
for k, v of author
  console.log "My " + k + " is " + v
