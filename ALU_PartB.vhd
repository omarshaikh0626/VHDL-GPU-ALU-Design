library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_PartB is
    port(
        Clock        : in  std_logic;               -- input Clock signal
        A, B       : in  unsigned(7 downto 0);    -- 8-bit inputs from latches A and B
        OP         : in  unsigned(15 downto 0);   -- 16-bit selector for Operation from Decoder
        Neg        : out std_logic;               -- For negative result
        R1         : out unsigned(3 downto 0);    -- lower 4-bits of 8-bit Result Output
        R2         : out unsigned(3 downto 0)     -- higher 4-bits of 8-bit Result Output
    );
end ALU_PartB;

architecture calculation of ALU_PartB is
    -- temporary signal declarations
    signal Reg1, Reg2, Result  : unsigned(7 downto 0);
    signal Reg4              	  : unsigned(0 to 7);
	begin

    Reg1 <= A; -- temporarily store A in Reg1 local variable
    Reg2 <= B; -- temporarily store B in Reg2 local variable

    process(Clock, OP)
    begin
        if(rising_edge(Clock)) THEN -- Do the calculation @ positive edge of Clock cycle.
           
			  Neg <= '0';  
				
				case OP is
                WHEN "0000000000000001" => Result <= (NOT Reg1(7 downto 4)) & Reg1(3 downto 0); --Invert the upper 4 bits of A
				
                WHEN "0000000000000010" => Result <= (others => '1');									-- Produce High bits only on the output
															 
                WHEN "0000000000000100" => 
						 if Reg1 > Reg2 then
								Result <= Reg1;
						 else
								Result <= Reg2;
						 end if;
					 
					 -- From here on the logic above repeats for the incrementing opcode
					 -- Questions assigned were B1 C5 & D1 => the first three cover that and the remaining repeat it
					 
                WHEN "0000000000001000" => Result <= (NOT Reg1(7 downto 4)) & Reg1(3 downto 0); -- Invert the upper 4 bits of A
						
                WHEN "0000000000010000" => Result <= (others => '1');									-- Produce High bits only on the output 
					 
                WHEN "0000000000100000" => 																		-- Max value checker btwn.  A & B
						 if Reg1 > Reg2 then
								Result <= Reg1;
						 else
								Result <= Reg2;
						 end if;	
					 
                WHEN "0000000001000000" => Result <= (NOT Reg1(7 downto 4)) & Reg1(3 downto 0); --Invert the upper 4 bits of A
					
                WHEN "0000000010000000" => Result <= (others => '1');									-- Produce High bits only on the output
					 
                WHEN "0000000100000000" => 																		-- Max value checker btwn.  A & B
						 if Reg1 > Reg2 then
								Result <= Reg1;
						 else
								Result <= Reg2;
						 end if;
					 
                WHEN OTHERS => Result <= "00000000";
					 
            end case;
        end if;
    end process;
	 
	 R1 <= Result(3 downto 0); -- Since the output seven segments can
	 R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits.
				

end calculation;