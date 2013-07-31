petData = require '../data/pets'
# List all pets as JSON
exports.list = (req, res) ->
  res.send petData
