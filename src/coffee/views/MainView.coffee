Backbone = require('backbone')
DisplayManager = require('utils/DisplayManager')

View =  require('views/View')
IntroView = require('views/IntroView')
GameView = require('views/GameView')

module.exports = class MainView extends Backbone.View

	constructor: (model, @controller) ->
		super({
			model
			el: '#mainview'
		})

		@views = []
		@displayManager = new DisplayManager()
		@model.on('change:state', @setView)

		console.log("MainView.constructor")

	onPageChange: (page, previous) =>
		@currentPage = page
		@displayManager.show(page)

	onError: (error) =>
		window.scrollTo(0, 0)

	setView: (model, id) =>
		view = @views[id] || @viewFactory(id)
		@displayManager.show(id)

	viewFactory: (id, model = @model) ->
		switch id
			when 'state.none'
				@none = view = new View(@model)
			when 'state.intro'
				@loader = view = new IntroView(@model)
			when 'state.game'
				@game = view = new GameView(@model)

		@displayManager.add(id, view)
		@views[id] = view
		return view
