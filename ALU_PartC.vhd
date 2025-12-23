library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_PartC is
    port(
        Clock        : in  std_logic;               -- input Clock signal
        A, B       : in  unsigned(7 downto 0);    -- 8-bit inputs
        ID         : in  unsigned(3 downto 0);    -- FSM Student ID
        OP         : in  unsigned(15 downto 0);   -- Microcode
		  Student_ID : out unsigned(3 downto 0);	  -- Student ID ouput
        R1         : out unsigned(3 downto 0)     -- Output ("y" or "n")
    );
end ALU_PartC;

architecture Behavior of ALU_PartC is
    signal Result : unsigned(3 downto 0);
begin

    process(Clock)
        variable odd : std_logic;
    begin
        if rising_edge(Clock) then
		  
		  Student_ID <= ID(3 DOWNTO 0);

            -- Determine odd/even
            odd := ID(0);    -- LSB = 1 is ODD

            case OP is  

                -- ALL microcode instructions: output "y" if odd, "n" if even
					 
                when "0000000000000001" |
                     "0000000000000010" |
                     "0000000000000100" |
                     "0000000000001000" |
                     "0000000000010000" |
                     "0000000000100000" |
                     "0000000001000000" |
                     "0000000010000000" |
                     "0000000100000000" =>

                        if odd = '1' then
                            Result <= "0001";   -- y
                        else
                            Result <= "0000";   -- n
                        end if;

                when others =>
                    Result <= "0000"; -- default: n
            end case;

        end if;
    end process;

    R1 <= Result(3 DOWNTO 0);
end Behavior;
