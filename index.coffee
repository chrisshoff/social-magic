server = require './server'
director = require 'director'
requestHandlers = require './requestHandlers'

router = new director.http.Router
	"/" : 
		get : requestHandlers.player,
	"/player" : 
		get : requestHandlers.player,
	"/table" : 
		get : requestHandlers.table,
	"/public/(.*)" :
		get : requestHandlers.staticFile

server.start router