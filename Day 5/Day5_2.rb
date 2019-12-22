#   Advent of Code 2019. Day 5, second part.
#   Luis Delgado.

class VM

    private

    def Get_Operands(processed_opcode,parameters_number)
	ret = Array.new(parameters_number)
#	print(processed_opcode,":",parameters_number,"\n")
	for i in 0..parameters_number-1 do
	    dat = @mem[@pc+1+i]
#	    puts(dat)
	    flag = processed_opcode[i+2] 
	    if(flag!= 1) then
		ret[i] = @mem[dat] 
	    else
		ret[i] = dat
	    end
	end

#	print(ret,"\n")
	return ret;
    end

    public

    def initialize(mem)
	@pc = 0;
	@mem = mem
    end

    def Get_mem() return @mem end

    def run()
	while(true) do
	    raw_opcode = @mem[@pc];
	    instruction = raw_opcode.digits(100)[0];
	    processed_opcode = raw_opcode.digits;
	    parameter_length = processed_opcode.length()-2;
	    jump = 0;

#	    print("@",@pc," opcode: ",raw_opcode,"\n")

	    case instruction
		when 1
		    operand = Get_Operands(processed_opcode,2)
		    @mem[@mem[@pc+3]] = operand[0] + operand[1];
		    jump=4;
		when 2
		    operand = Get_Operands(processed_opcode,2)
		    @mem[@mem[@pc+3]] = operand[0] * operand[1]
		    jump=4;
		when 3
		    @mem[@mem[@pc+1]] = gets.to_i()
		    jump=2
		when 4
		    operand = Get_Operands(processed_opcode,1)
		    print(operand[0],"\n");
		    jump=2
		when 5
		    operand = Get_Operands(processed_opcode,2)
		    if(operand[0]!=0) then @pc = operand[1] ;jump=0;
		    else jump=3 end
		when 6
		    operand = Get_Operands(processed_opcode,2)
		    if(operand[0]==0) then @pc = operand[1] ;jump=0;
		    else jump=3 end
		when 7
		    flag = 0
		    operand = Get_Operands(processed_opcode,2)
		    if(operand[0]<operand[1]) then flag=1 end
		    @mem[@mem[@pc+3]]=flag;
		    jump=4;
		when 8
		    flag = 0
		    operand = Get_Operands(processed_opcode,2)
		    if(operand[0]==operand[1]) then flag=1 end
		    @mem[@mem[@pc+3]]=flag;
		    jump=4;

		when 99
		    break;
		else
		    print("Opcode Error ",@mem[@pc]," @",@pc)
		    break
	    end
	    @pc=@pc+jump;
	end
	print("\n");
    end
end

mem = (File.read("Day5_Input.txt").split(',')).map!(&:to_i)
intcodePC = VM.new(mem);
intcodePC.run()
