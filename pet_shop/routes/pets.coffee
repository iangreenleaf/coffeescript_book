nStore = require 'nstore'
nStore = nStore.extend require('nstore/query')()

# List all pets as JSON
exports.list = (req, res) ->
  nStore.new 'data/pets.db', (err, petsDB) ->
    return _fail err, res if err?
    petsDB.find "sold !=": true, (err, result) ->
      return _fail err, res if err?
      response = for key, pet of result
        pet.id = key
        pet
      res.send response

exports.buy = (req, res) ->
  nStore.new 'data/pets.db', (err, petsDB) ->
    return _fail err, res if err?
    petsDB.get req.params.id, (err, pet) ->
      return _fail err, res if err?
      pet.sold = true
      petsDB.save req.params.id, pet, (err, key) ->
        return _fail err, res if err?
        res.render "purchase_confirmation", pet

_fail = (err, res) ->
  console.log err
  res.send 500
