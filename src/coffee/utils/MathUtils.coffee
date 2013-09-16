
module.exports = class MathUtils
	@randomInt:(low, high) ->
		return Math.floor(Math.random() * (1 + high - low)) + low

	@getRandomIntExclude: (low, high, exclude) ->
		while exclude.indexOf(r) not -1
			r = func.randomInt(low, high)
		
		return r