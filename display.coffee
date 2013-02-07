mustache = require 'mustache'
fs = require 'fs'

templates = {}

read = (file) ->
	console.log "Reading #{file}"
	fs.readFile "#{__dirname}/views/#{file}", "utf8", (err, html) ->
		templates[file.split(".")[0]] = html

fs.readdir "#{__dirname}/views", (err, files) ->
	read file for file in files

render = (response, page, data) ->
	output = mustache.render templates[page], data
	response.writeHead 200, "Content-Type" : "text/html"
	response.write output
	response.end()

exports.render = render