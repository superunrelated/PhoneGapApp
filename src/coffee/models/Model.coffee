Backbone = require('backbone')

module.exports = class Model extends Backbone.Model
	constructor: (attrs = {}, options = {}) ->
		attrs = _.clone(attrs)
		attrs.state = undefined
		super(attrs, options)