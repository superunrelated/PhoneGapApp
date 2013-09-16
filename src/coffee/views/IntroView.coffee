Backbone = require('backbone')
View = require('views/View')

module.exports = class IntroView extends View

	constructor: (model) ->
		super({
			el: '#introview'
			model
		})

		console.log('IntroView')

		@$startButton = @$el.find('[name=startbutton]')
		@$startButton.on('click', =>
			console.log("clicky")
			Backbone.trigger('show:game')
		)