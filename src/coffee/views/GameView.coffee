Backbone = require('backbone')
View = require('views/View')

module.exports = class GameView extends View

	constructor: (model) ->
		super({
			el: '#gameview'
			model
		})

		@width = 0
		@height = 0

		@$body = $('body')
		@$canvas = $('canvas#game')
		@stage = new createjs.Stage("game")
		@stage.enableMouseOver(10)
		createjs.Touch.enable(@stage)

		Backbone.on('app:resize', @resize)

		@bg = new createjs.Shape()
		@stage.addChild(@bg)

		@dot = new createjs.Shape()
		@dot.graphics
			.beginFill('red')
			.drawCircle(0, 0, 15)
			.endFill()
		@stage.addChild(@dot)

		@stage.update()
		@resize()

		options = { frequency: 40 }
		watchID = navigator.accelerometer.watchAcceleration(@onSuccess, @onError, options)

	resize: () =>
		@width = @$body.width()
		@height = @$body.height()
		console.log("GameView.resize()", @width, @height)
		@$canvas.attr(
			width: @width
			height: @height
		)

		@bg.graphics
			.beginFill('green')
			.drawRect(0, 0, @width, @height)
			.endFill()

		@stage.update()


	onSuccess: (acceleration) =>
    # console.log('Acceleration X: ' + acceleration.x + '\n' +
    #       'Acceleration Y: ' + acceleration.y + '\n' +
    #       'Acceleration Z: ' + acceleration.z + '\n' +
    #       'Timestamp: '      + acceleration.timestamp + '\n')

    tx = @dot.x - (acceleration.x * 2)
    ty = @dot.y + (acceleration.y * 2)

    tx = Math.max(0, Math.min(@width, tx))
    ty = Math.max(0, Math.min(@height, ty))

    @dot.x = tx
    @dot.y = ty

    @stage.update()

	onError:() =>
    alert('onError!')




