display = require('./display')
static = require('node-static')

webroot = "."

file = new(static.Server) webroot, 
	cache : 600,
	headers :
		'X-Powered-By' : 'node-static'

player = ->
	console.log "Request handler 'player' was called."

	view = title : "Player", content : "Here's the content."
	display.render this.res, "page", view

table = ->
	console.log "Request handler 'table' was called."

	view = title : "Table", content : "Here's the content."
	display.render this.res, "page", view

staticFile = ->
	console.log "Request handler for static file called"

	file.serve this.req, this.res, (err, result) ->
		if err
			console.error "Error serving - #{err.message}"
			if err.status is 404 or err.status is 500
				file.serveFile "/#{err.status}.html", err.status, {}, this.req, this.res
			else
				this.res.writeHead err.status, err.headers
				res.end()


exports.player = player
exports.table = table
exports.staticFile = staticFile