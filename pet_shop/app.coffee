
###
Module dependencies.
###
express = require("express")
assets = require("connect-assets")
routes = require("./routes")
user = require("./routes/user")
pets = require("./routes/pets")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "ejs"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use assets()
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
app.get "/pets", pets.list
app.post "/pets/:id/buy", pets.buy
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

