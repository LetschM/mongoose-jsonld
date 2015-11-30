Async    = require 'async'
Mongoose = require 'mongoose'
TSON     = require 'tson'
Schemo   = require '../src'
test     = require 'tapes'

log = require('infolis-logging')(module)

class Base

	XSD: 'http://www.w3.org/2001/XMLSchema#'
	RDF: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#'
	BASEURI: 'http://infolis.gesis.org/infolink'
	SCHEMABASE:'http://infolis.gesis.org/infolink/schema/'

	connect: ->
		@schemo = new Schemo(
			mongoose: Mongoose.createConnection('mongodb://localhost:27018/mongoose-test')
			baseURI: @BASEURI
			apiPrefix: '/api'
			schemo: TSON.load "#{__dirname}/../../infolis-web/data/infolis.tson"
		)

	disconnect: ->
		log.info("Closing connection")
		@schemo.mongoose.close()


module.exports = new Base()
