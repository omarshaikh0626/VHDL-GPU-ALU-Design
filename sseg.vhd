LIBRARY ieee;
USE ieee.std_logic_1164.all;

Entity sseg IS 
    PORT(
        bcd     : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
        Neg    : IN  STD_LOGIC;
        leds    : OUT STD_LOGIC_VECTOR(0 TO 6);
        negleds : OUT STD_LOGIC_VECTOR(0 TO 6)
    );
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN

    -- BCD to 7-segment
    PROCESS(bcd)
    BEGIN
        CASE bcd IS           -- a b c d e f g
            WHEN "0000" => leds <= NOT("1111110"); -- 0
            WHEN "0001" => leds <= NOT("0110000"); -- 1
            WHEN "0010" => leds <= NOT("1101101"); -- 2
            WHEN "0011" => leds <= NOT("1111001"); -- 3
            WHEN "0100" => leds <= NOT("0110011"); -- 4
            WHEN "0101" => leds <= NOT("1011011"); -- 5
            WHEN "0110" => leds <= NOT("1011111"); -- 6
            WHEN "0111" => leds <= NOT("1110000"); -- 7
            WHEN "1000" => leds <= NOT("1111111"); -- 8
            WHEN "1001" => leds <= NOT("1110011"); -- 9
            WHEN "1010" => leds <= NOT("1110111"); -- A
            WHEN "1011" => leds <= NOT("0011111"); -- b
            WHEN "1100" => leds <= NOT("1001110"); -- C
            WHEN "1101" => leds <= NOT("0111101"); -- d
            WHEN "1110" => leds <= NOT("1001111"); -- E
            WHEN "1111" => leds <= NOT("1000111"); -- F

            WHEN OTHERS =>
                leds <= (others => '1');  -- all OFF for active-low
        END CASE;
    END PROCESS;


    -- Neg (negative indicator: segment g only)
    PROCESS(Neg)
    BEGIN 
        IF Neg = '1' THEN
            negleds <= NOT("0000001");   -- only segment g ON
        ELSE
            negleds <= NOT("0000000");   -- all segments OFF
        END IF;
    END PROCESS;

END Behavior;
