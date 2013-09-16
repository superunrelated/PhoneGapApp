require('dom.ready')
ResizeService = require('services/ResizeService')
Model = require('models/Model')
Controller = require('controllers/Controller')
MainView = require('views/MainView')

module.exports = class Application

	constructor: (@config = {}) ->

		# console = new Object()
		# console.log = (log) =>
		# 	NativeBridge.call("logToConsole", [log])
		
		# console.debug = console.log
		# console.info = console.log
		# console.warn = console.log
		# console.error = console.log
		
		# window.onerror = (error, url, line) =>
		# 	console.log('ERROR: '+error+' URL:'+url+' L:'+line)

		@bindEvents()

	bindEvents: () =>
		document.addEventListener('deviceready', @onDeviceReady, false)

	onDeviceReady: () =>
		console.log("Application.onDeviceReady")
		app.receivedEvent('deviceready')
		
		window.setInterval( 
			() =>
				console.log("foo!")
			, 500
		)

	receivedEvent: (id) =>
		parentElement = document.getElementById(id);
		listeningElement = parentElement.querySelector('.listening')
		receivedElement = parentElement.querySelector('.received')

		listeningElement.setAttribute('style', 'display:none;')
		receivedElement.setAttribute('style', 'display:block;')


		console.log('Received Event: ' + id)

		@resize = new ResizeService()

		@model = new Model()
		@controller = new Controller(@model)
		@mainView = new MainView(@model, @controller)

		@controller.init()
