Make sure your ruby version is *ruby 2.3.1p112*

Runtime Complexity: O(1)

To run tests (from project root directory): `ruby test.rb`

To get an intersection over union result (from project root directory): `ruby iou.rb 0,0,4,4 2,0,4,4`
 - the two arguments required by iou.rb are a comma delimited string of x,y,width,height describing a box
 		- for example, to compare a box {x: 1,y: 2,width: 3,height: 4} with itself the command would be `ruby iou.rb 1,2,3,4 1,2,3,4`