#   Advent of Code 2019. Day 4, first part.
#   Luis Delgado.


def Manhattan_Dist(ax,ay,bx,by) 
    return ((ax-bx).abs()) + ((ay-by).abs())
end

input = IO.readlines("Day3_Input.txt")

wires = Array.new(input.length())

paths = [Array.new(),Array.new()];


for i in 0..input.length() do
    if(input[i] != nil) then 
	input[i] = input[i].split(',')
	wires[i] = Array.new()
	wires[i][0] = [0,0]
	wirec = 1;
	for o in 0..input[i].length() do
	    rawdirection = input[i][o]
	    if(rawdirection != nil) then
		xx=0
		yy=0
		direction = rawdirection[0];
		case direction 
		    when 'U'
			yy=1;
		    when 'R'
			xx=1;
		    when 'D'
			yy=-1;
		    when 'L'
			xx=-1;	
		end
		l = rawdirection.scan(/\d+/).first.to_i()
		ox = (wires[i][wirec-1][0])
		oy = (wires[i][wirec-1][1])
		wires[i][wirec] = [
		(wires[i][wirec-1][0]+(xx*l)),
		(wires[i][wirec-1][1]+(yy*l))]
		wirec+=1;

		for u in 0...l do
		    paths[i].push([ox,oy])
		    ox+=(xx)
		    oy+=(yy)
		end	    
	    end
	end
    end
end

intersection = (paths[0] & paths[1])

dist = 0xffffffffffffffff
for i in 1..intersection.length() do
    cur = intersection[i]
    if(cur != nil) then
	mdist = Manhattan_Dist(0,0,cur[0],cur[1])
	if(mdist < dist) then dist = mdist end
    end
end

puts dist
