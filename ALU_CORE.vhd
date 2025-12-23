library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_CORE is
    port(
        Clk        : in  std_logic;               -- input Clock signal
        A, B       : in  unsigned(7 downto 0);    -- 8-bit inputs from latches A and B
        OP         : in  unsigned(15 downto 0);   -- 16-bit selector for Operation from Decoder
        Neg        : out std_logic;               -- For negative result
        R1         : out unsigned(3 downto 0);    -- lower 4-bits of 8-bit Result Output
        R2         : out unsigned(3 downto 0)     -- higher 4-bits of 8-bit Result Output
    );
end ALU_CORE;

architecture calculation of ALU_CORE is
    -- temporary signal declarations
    signal Reg1, Reg2, Result : unsigned(7 downto 0);
    signal Reg4               : unsigned(0 to 7);
	begin

   Reg1 <= A; -- temporarily store Reg1 in Reg1 local variable
   Reg2 <= B; -- temporarily store Reg2 in Reg2 local variable

    process(Clk)
    begin
        if(rising_edge(Clk)) THEN -- Do the calculation @ positive edge of Clk cycle.
		  
			  Neg <= '0'; 
				
				case OP is
                WHEN "0000000000000001" => Result <= Reg1 + Reg2;
						  
                WHEN "0000000000000010" =>

                    Result <= Reg1 - Reg2;
                        
                    IF Result(7) = '1' THEN 
                        Neg <= '1';
                    END IF;
							
                WHEN "0000000000000100" => Result <= NOT Reg1; 
					 
                WHEN "0000000000001000" => Result <= Reg1 NAND Reg2;
					 
                WHEN "0000000000010000" => Result <= Reg1 NOR Reg2;
					 
                WHEN "0000000000100000" => Result <= Reg1 AND Reg2;
					 
                WHEN "0000000001000000" => Result <= Reg1 XOR Reg2;
					 
                WHEN "0000000010000000" => Result <= Reg1 OR Reg2;
					 
                WHEN "0000000100000000" => Result <= Reg1 XNOR Reg2;
					 
                WHEN OTHERS => Result <= "00000000";
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0); -- Since the output seven segments can
    R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits.


end calculation;
