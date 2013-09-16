Backbone = require('backbone')

module.exports = class View extends Backbone.View

	DURATION: 0.5

	constructor: (options) ->
		super(options)

	show: =>
		@$el.css('display','table-cell')
		TweenMax.to(@$el, @DURATION, {autoAlpha:1, onComplete:@showComplete})
		@trigger('view:show', @)

	hide: =>
		@trigger('view:hide', @)
		TweenMax.to(@$el, @DURATION, {autoAlpha:0, onComplete:@hideComplete})

	showComplete: =>
		# log("View.showComplete()")
		@trigger('view:showComplete', @)

	hideComplete: =>
		@$el.css('display','none')
		@trigger('view:hideComplete', @)


	# startTimeout: (time, func, params) =>
	# 	@viewtimer = TweenMax.delayedCall(time, func, params)

	# cancelTimeout: () =>
	# 	if @viewtimer
	# 		@viewtimer.kill()
	# 		@viewtimer = undefined


	# my doMyShither module

