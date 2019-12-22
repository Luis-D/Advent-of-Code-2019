#   Advent of Code 2019. Day 1, first part.
#   Luis Delgado.

def function(val)
    return (((val/3).floor())-2);
end

arr = IO.readlines("Day1_Input.txt")

result = 0;
for i in 0...arr.length() do
    val = arr[i].to_i();
    result = result + function(val)
end

puts(result)

return result
