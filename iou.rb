#!/usr/bin/env ruby

require './box.rb'

# intersection over union (jaccard index), takes 2 boxes and returns the jaccard index
# see https://en.wikipedia.org/wiki/Jaccard_index for more details on the calculation
def iou(a,b)
	a.iou(b)
end

box1 = Box.new(*ARGV[0].split(','))
box2 = Box.new(*ARGV[1].split(','))

puts iou(box1,box2)