library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end;

architecture sim of testbench is
    component sillyfunction
        port(A, B, C: in STD_LOGIC;
             Y: out STD_LOGIC);
    end component;

    signal A, B, C, Y: STD_LOGIC;

begin
    -- instantiate device under test
    DUT: sillyfunction port map(B, B, C, Y);

    -- apply inputs one at a time
    -- checking results
    process begin
        A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;
        assert Y = '1' report "000 failed.";

        C <= '1'; wait for 10 ns;
        assert Y = '0' report "001 failed.";

        B <= '1'; C <= '0'; wait for 10 ns;
        assert Y = '0' report "010 failed.";
        
        C <= '1'; wait for 10 ns;
        assert Y = '0' report "011 failed.";
        
        A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;
        assert Y = '1' report "100 failed.";

        C <= '1'; wait for 10 ns;
        assert Y = '1' report "101 failed.";

        B <= '1'; C <= '0'; wait for 10 ns;
        assert Y = '0' report "110 failed.";

        C <= '1'; wait for 10 ns;
        assert Y = '0' report "111 failed.";
        
        wait; 
    end process;
end;