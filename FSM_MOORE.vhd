library ieee;
use ieee.std_logic_1164.all;
entity FSM_MOORE is 
	port
	(
		Clock	: in	std_logic; --clock
		data_in	: in	std_logic; --input
		Reset	: in std_logic; --Reset
		student_id	: out		std_logic_vector(3 downto 0); --student id
		current_state	: out	std_logic_vector(3 downto 0) --current state
		); 
	end entity;	
	architecture fsm of FSM_MOORE is 
		type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
		
		--register to hold the current state
		signal yfsm : state_type;
	BEGIN	
		process (Clock, Reset)
		BEGIN
			if Reset = '1' then 
				yfsm <= s0;
	ELSIF (Clock'EVENT AND Clock = '0') THEN
				--determines next state based on current state and the input
				case yfsm is 
					when s0 => 
						if data_in = '1' then --s0 -> s8
							yfsm <= s1;
						else yfsm <= s0;	--stays at state when input = 0
						end if;
					when s1 => 
						if data_in = '1' then --s1 -> s0
							yfsm <= s2;
						else yfsm <= s1;	--stays at state when input = 0
						end if;						
					when s2 => 
						if data_in = '1' then --s2 -> s1
							yfsm <= s3;
						else yfsm <= s2;	--stays at state when input = 0
						end if;
					when s3 => 
						if data_in = '1' then --s3 -> s2
							yfsm <= s4;
						else yfsm <= s3;	--stays at state when input = 0
						end if;
					when s4 => 
						if data_in = '1' then --s4 -> s3
							yfsm <= s5;
						else yfsm <= s4;	--stays at state when input = 0
						end if;						
					when s5 => 
						if data_in = '1' then --s5 -> s4
							yfsm <= s6;
						else yfsm <= s5;	--stays at state when input = 0
						end if;
					when s6 => 
						if data_in = '1' then --s6 -> s5
							yfsm <= s7;
						else yfsm <= s6;	--stays at state when input = 0
						end if;
					when s7 => 
						if data_in = '1' then --s7 -> s6 
							yfsm <= s8;
						else yfsm <= s7;	--stays at state when input = 0
						end if;						
					when s8 => 
						if data_in = '1' then --s8 -> s0
							yfsm <= s0;
						else yfsm <= s8;	--stays at state when input = 0
						end if;
					end case;
				end if;
			end process;
			
			-- moore logic 
			process (yfsm, data_in) -- data_in is read only
    begin
        case yfsm is
            when s0 =>
                current_state <= "0000";
                student_id    <= "0101"; 
            when s1 =>
                current_state <= "0001";
                student_id    <= "0000";
            when s2 =>
                current_state <= "0010";
                student_id    <= "0001";
            when s3 =>
                current_state <= "0011";
                student_id    <= "0010";
            when s4 =>
                current_state <= "0100";
                student_id    <= "1001";
            when s5 =>
                current_state <= "0101";
                student_id    <= "1001";
            when s6 =>
                current_state <= "0110";
                student_id    <= "0001";
            when s7 =>
                current_state <= "0111";
                student_id    <= "1000";
            when s8 =>
                current_state <= "1000";
                student_id    <= "1000"; -- Final state output
        end case;
    end process;
end architecture;

