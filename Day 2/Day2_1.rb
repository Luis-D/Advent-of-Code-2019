#   Advent of Code 2019. Day 2, first part.
#   Luis Delgado.




class VM
    def initialize(mem)
	@pc = 0;
	@mem = mem
    end

    def Get_mem() return @mem end

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
mem[1]=12;
mem[2]=2;

IntcodePC = VM.new(mem);
IntcodePC.run()
print(mem[0],"\n")
