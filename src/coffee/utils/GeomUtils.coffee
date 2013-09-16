

module.exports = class GeomUtils
	
	@angleDistance: (a, b) ->
		rev = Math.PI * 2
		diff = a - b
		if Math.abs(diff) > Math.PI
			return diff + rev
		else
			return diff

	@angle: (x1, y1, x2, y2) ->
		Math.atan2(y2 - y1, x2 - x1)
		
	@distance: (x1, y1, x2, y2) ->
		dx = x1 - x2
		dy = y1 - y2
		Math.sqrt((dx * dx) + (dy * dy))

	@pointDistance: (p1, p2) ->
		dx = p1.x - p2.x
		dy = p1.y - p2.y
		Math.sqrt((dx * dx) + (dy * dy))

	@radToDeg: (radians) ->
		(radians/ (Math.PI*2)) * 360

	@degToRad: (degrees) ->
		(degrees/360)*Math.PI*2

	@LineDistance: (p, start, end) ->
		p2 = 
			x: end.x - start.x
			y: end.y - start.y
		u = ((p.x - start.x) * p2.x + (p.y - start.y) * p2.y) / (p2.x*p2.x + p2.y*p2.y)

		if u > 1
			u = 1
		else if u < 0
			u = 0

		x = start.x + u * p2.x
		y = start.y + u * p2.y
		dx = x - p.x
		dy = y - p.y

		return Math.sqrt(dx*dx + dy*dy)