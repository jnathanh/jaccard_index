require './box.rb'

$box = Box.new(0,0,4,4)
$half_overlap_box = Box.new(2,0,4,4)
$corner_overlap_box = Box.new(2,2,4,4)
$opposite_corner_overlap_box = Box.new(-2,-2,4,4)
$zero_overlap_box = Box.new(4,0,4,4) # touching
$zero_overlap_box2 = Box.new(5,0,4,4) # not touching

def test_x_intersection
	puts "----#{__method__}----"

	puts ($box.x_intersection($box) == 4 ? :passed : :failed)
	puts ($box.x_intersection($half_overlap_box) == 2 ? :passed : :failed)
	puts ($box.x_intersection($corner_overlap_box) == 2 ? :passed : :failed)
	puts ($box.x_intersection($opposite_corner_overlap_box) == 2 ? :passed : :failed)
	puts ($box.x_intersection($zero_overlap_box) == 0 ? :passed : :failed)
	puts ($box.x_intersection($zero_overlap_box2) == 0 ? :passed : :failed)
end

def test_y_intersection
	puts "----#{__method__}----"

	puts ($box.y_intersection($box) == 4 ? :passed : :failed)
	puts ($box.y_intersection($half_overlap_box) == 4 ? :passed : :failed)
	puts ($box.y_intersection($corner_overlap_box) == 2 ? :passed : :failed)
	puts ($box.y_intersection($opposite_corner_overlap_box) == 2 ? :passed : :failed)
	puts ($box.y_intersection($zero_overlap_box) == 4 ? :passed : :failed)
	puts ($box.y_intersection($zero_overlap_box2) == 4 ? :passed : :failed)
end

def test_intersection
	puts "----#{__method__}----"

	puts ($box.intersection($box) == 16 ? :passed : :failed)
	puts ($box.intersection($half_overlap_box) == 8 ? :passed : :failed)
	puts ($box.intersection($corner_overlap_box) == 4 ? :passed : :failed)
	puts ($box.intersection($opposite_corner_overlap_box) == 4 ? :passed : :failed)
	puts ($box.intersection($zero_overlap_box) == 0 ? :passed : :failed)
	puts ($box.intersection($zero_overlap_box2) == 0 ? :passed : :failed)
end

def test_full_overlap
	puts "----#{__method__}----"

	j = $box.iou($box)


	if j == 1
		puts :passed
	else
		puts :failed
	end
end

def test_half_overlap
	puts "----#{__method__}----"
	j = $box.iou($half_overlap_box)

	if j == 1.0/3
		puts :passed
	else
		puts :failed
	end
end

def test_corner_overlap
	puts "----#{__method__}----"

	j = $box.iou($corner_overlap_box)

	if j == 4.0/28
		puts :passed
	else
		puts :failed
	end
end

def test_zero_overlap_touching
	puts "----#{__method__}----"

	j = $box.iou($zero_overlap_box)

	if j == 0
		puts :passed
	else
		puts :failed
	end
end

def test_zero_overlap_separated
	puts "----#{__method__}----"

	j = $box.iou($zero_overlap_box2)

	if j == 0
		puts :passed
	else
		puts :failed
	end
end

test_x_intersection
test_y_intersection
test_intersection
test_full_overlap
test_half_overlap
test_corner_overlap
test_zero_overlap_touching
test_zero_overlap_separated