LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg_PartC IS
PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		leds: OUT STD_LOGIC_VECTOR(1 TO 7) ) ;
END sseg_PartC;

ARCHITECTURE Behavior OF sseg_PartC IS
BEGIN
	PROCESS ( bcd)
	BEGIN

		CASE bcd IS 		    --  abcdefg
			WHEN "0001" =>leds <= "1101010"; -- n
			WHEN "0000" =>leds <= "1000100"; -- y
			
			WHEN OTHERS =>leds <= "-------";
		END CASE;
	END PROCESS;
END Behavior;