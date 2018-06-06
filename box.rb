
# Box defines a square where the upper left corner is at point x,y
class Box
	attr_accessor :x,:y,:width,:height

	def initialize(x,y,width,height)
		self.x = x.to_i
		self.y = y.to_i
		self.width = width.to_i
		self.height = height.to_i
	end

	# intersection over union (jaccard index), takes a box and returns the jaccard index of the 
	# current box and the given box see https://en.wikipedia.org/wiki/Jaccard_index for more details 
	# on the calculation
	def iou(b)
		intersection(b).to_f / (area + b.area - intersection(b))
	end

	# returns the intersection of this box with the given box (b)
	def intersection(b)
		x_intersection(b) * y_intersection(b)
	end

	# returns the ammount the current box intersects a second box(b) on the x axis
	def x_intersection(b)
		max_shared_x = [x_max,b.x_max].min
		min_shared_x = [x_min,b.x_min].max

		[0,max_shared_x - min_shared_x].max
	end

	# returns the ammount the current box intersects a second box(b) on the y axis
	def y_intersection(b)
		max_shared_y= [y_max,b.y_max].min
		min_shared_y = [y_min,b.y_min].max

		[0,max_shared_y - min_shared_y].max
	end

	def area
		width * height
	end

	def x_max
		x + width
	end

	def x_min
		x
	end

	def y_max
		y
	end

	def y_min
		y - height
	end

end