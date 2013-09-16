Backbone = require('backbone')

module.exports = class Controller

	constructor: (@model) ->
		Backbone.on('show:intro', 			@showIntro 			)
		Backbone.on('show:game', 				@showGame				)

	init: () =>
		console.log("Controller.init", @model)
		@showIntro()

	showIntro: () =>
		console.log("Controller.showIntro", @model)
		@model.set('state', 'state.intro')
		
	showGame: () =>
		console.log("Controller.showGame")
		@model.set('state', 'state.game')