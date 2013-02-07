server = require('./server')
router = require('./router')
requestHandlers = require('./requestHandlers')

handle = {}
handle["/"] = requestHandlers.player
handle["/player"] = requestHandlers.player
handle["/table"] = requestHandlers.table

server.start router.route, handle