#   Advent of Code 2019. Day 2, second part.
#   Luis Delgado.

class VM
    def Set_mem(mem) @mem = mem.clone();@pc=0 end 
    def Get_mem() return @mem end

    def initialize(mem)
	Set_mem(mem);
    end

    def run()
	while(true) do
	    opcode = @mem[@pc]
	    case opcode
		when 1
		    @mem[@mem[@pc+3]] = @mem[@mem[@pc+1]] + @mem[@mem[@pc+2]]
		when 2
		    @mem[@mem[@pc+3]] = @mem[@mem[@pc+1]] * @mem[@mem[@pc+2]]
		when 99
		    break;
		else
		    print("Opcode Error ",@mem[@pc]," @",@pc)
		    break
	    end
	    @pc=@pc+4
	end
    end
end

mem = (File.read("Day2_Input.txt").split(',')).map!(&:to_i)

noun = 0;
verb = 0;

IntcodePC = VM.new(mem)

for noun in 0..99 do
    found = false
    for verb in 0..99 do
	mem[1] = noun
	mem[2] = verb
	IntcodePC.Set_mem(mem)
	IntcodePC.run()
	result =IntcodePC.Get_mem()[0];
	if(result == 19690720) then found = true; break end
    end
    if(found) then break end
end

print(100 * noun + verb)
