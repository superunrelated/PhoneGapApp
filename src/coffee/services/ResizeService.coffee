Backbone = require('backbone')
platform = require('env.platform')

module.exports = class ResizeService
	constructor: (@config = {}) ->
		$(window).on('resize orientationchange', @onResizeProxy)
		@onResizeProxy()

	onResizeProxy:(e) =>
		#Scroll to 0,0 for revealing the original browser size
		if $('body').is('.game')
				scrollTo(0,0);
		
		clearTimeout(@delay)
		@delay = setTimeout(@onResize, 500)
		
	onResize: =>
		dim = 
			width:$(window).width()
			height:$(window).height()

		Backbone.trigger('app:resize', dim.width, dim.height)