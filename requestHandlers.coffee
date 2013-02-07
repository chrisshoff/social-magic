display = require('./display')

player = (request, response) ->
	console.log "Request handler 'player' was called."

	view = title : "Player", content : "Here's the content."
	display.render response, "page", view

table = (request, response) ->
	console.log "Request handler 'table' was called."

	view = title : "Table", content : "Here's the content."
	display.render response, "page", view

exports.player = player
exports.table = table