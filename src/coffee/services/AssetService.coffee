Backbone = require('backbone')

module.exports = class AssetService

	constructor: () ->
		_.extend(@, Backbone.Events)

		@assets = new createjs.LoadQueue(true)
		@assets.addEventListener('complete', @onComplete)
		@assets.addEventListener('progress', @onProgress)
		@assets.addEventListener('fileload', @onFile)
		@assets.addEventListener('error', @onError)

	load:(manifest) =>
		@assets.loadManifest(manifest)
		return @

	onProgress: (event) =>
		# log('AssetService.onProgress', event)
		@trigger('progress', event)
		return

	onFile: (event) =>
		# log('AssetService.onFile', event)
		return

	onComplete: (event) =>
		# log('AssetService.onComplete', event)
		@trigger('complete', event)
		return

	onError: (event) =>
		log('AssetService.onFile', event)
		@trigger('error', event)
		return	

	getResult: (id) =>
		return @assets.getResult(id)
		

