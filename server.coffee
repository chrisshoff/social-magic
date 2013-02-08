http = require "http"
url = require "url"
io = (require "socket.io")

start = (router) ->
	onRequest = (request, response) ->
		router.dispatch request, response, (err) ->
			if err
				response.writeHead 404, "Content-Type" : "text/plain"
				response.write "404 Not Found"
				response.end()

	server = http.createServer(onRequest)
	server.listen 8888

	io.listen(server).on 'connection', (socket) ->
		console.log "Got WS Connection"
		socket.emit "test", test : "value"

	console.log "Server has started."

exports.start = start