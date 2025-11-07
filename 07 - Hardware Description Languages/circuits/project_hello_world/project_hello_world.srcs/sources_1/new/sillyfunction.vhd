library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sillyfunction is
    port(A, B, C: in STD_LOGIC;
         Y: out STD_LOGIC);
end;

architecture synth of sillyfunction is
begin
    y <= (not A and not B and not C) or
         (A and not B and not C) or
         (A and not B and C);
end;