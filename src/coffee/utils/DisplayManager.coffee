Backbone = require('backbone')

module.exports = class DisplayManager

	constructor: ->
		_.extend(@, Backbone.Events);

		@$body = $('body')
		@items = {}
		@current = null
		@pending = null
		@working = false

	add: (id, instance) ->
		@items[id] = instance

	remove: (id) ->
		delete @items[id]

	show: (id, reverse) ->
		if item = @items[id]
			if item isnt @current
				@pending = item
				@work(true)
				@change(reverse)
				item
		# Hide existing
		else if id is null and @current
			@work(true)
			@change(reverse)
		else
			throw "item: #{id} has not been added to DisplayManager"

	# Hide the current object based on it's id
	# param  id    The object's registered id
	hide: (id) ->
		if (item = @items[id]) and (item is @current)
			@pending = null
			@change()
			item

	change: (reverse) ->
		if not @current and @pending
			@current = @pending
			@current.on('view:showComplete', @onShowComplete)
			@current.show(reverse)
		else
			@current.on('view:hideComplete', @onHideComplete)
			@current.hide(reverse)

	onShowComplete: (item) =>
		item.off('view:showComplete', @onShowComplete)
		@work(false)
		@trigger('displaymanager.showComplete')

	onHideComplete: (item, reverse) =>
		item.off('view:hideComplete', @onHideComplete)
		@current = null
		@change(reverse) if @pending
		@trigger('displaymanager.hideComplete')

	work: (value) ->
		if value isnt @working
			@working = value
			# if @working
				# @$body.css('overflow', 'hidden')
				# window.scrollTo(0, 0)
			# else
			# 	@$body.css('overflow', 'auto')

