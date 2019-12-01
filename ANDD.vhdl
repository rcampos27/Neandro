library ieee;
use ieee.std_logic_1164.all;


entity ANDD is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end entity;

architecture behavior of ANDD is

begin
--[0]  cPC
output(0) <= (not(step(2)) and not(step(1)) and step(0)) or (step(2) and step(1) and not(step(0)));
--[1]  selPC++/BARR
output(1) <= '0';
--[2]  selPC/BARR
output(2) <= step(1);
--[3]  cREM
output(3) <= (not(step(2)) and not(step(0))) or (step(2) and not(step(1)) and step(0));
--[4]  R/nW e BLOCK
output(4) <= '1'; 
--[5]  cRDM
output(5) <= (not(step(2)) and step(0)) or (step(2) and step(1) and not(step(0)));
--[6]  cRI
output(6) <= step(2) and step(1) and step(0);
--[7-9]  selOP (3 bits)
output(7) <= '0';
output(8) <= '1';
output(9) <= '0';
--[10]  cAC
output(10) <=  step(2) and not(step(1)) and not(step(0));

end architecture;
