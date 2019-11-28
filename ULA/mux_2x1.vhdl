library ieee;
use  ieee.std_logic_1164.all;

entity mux_2x1 is
    port (
        I0, I1, Sel : in  std_logic;
        S           : out std_logic
    );
end entity;

architecture behavior of mux_2x1 is

begin
    S <= (I0 and (not Sel)) or (I1 and Sel);
end architecture;