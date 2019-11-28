library ieee;
use  ieee.std_logic_1164.all;

entity nand_3in is
    port(
        A, B, C : in  std_logic;
        Snand   : out std_logic
    );
end entity;

architecture behavior of nand_3in is 

begin 
    Snand <= not (A and B and C);

end architecture;
