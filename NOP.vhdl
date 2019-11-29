library ieee;
use ieee.std_logic_1164.all;


entity NOP is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end entity;

--[0]  cPC
--[1]  selPC++/BARR
--[2]  selPC/BARR
--[3]  cREM
--[4]  R/nW e BLOCK
--[5]  cRDM
--[6]  cRI
--[7-9]  selOP (3 bits)
--[10]  cAC

architecture behavior of NOP is

begin
--[0]  cPC
output(0) <= step(2) and step(1) and not(step(0));
--[1]  selPC++/BARR
output(1) <= '0';
--[2]  selPC/BARR
output(2) <= '0';
--[3]  cREM
output(3) <= step(2) and not(step(1)) and step(0);
--[4]  R/nW e BLOCK
output(4) <= '1'; 
--[5]  cRDM
output(5) <= step(2) and step(1) and not(step(0));
--[6]  cRI
output(6) <= step(2) and step(1) and step(0);
--[7-9]  selOP (3 bits)
output(7) <= 'Z';
output(8) <= 'Z';
output(9) <= 'Z';
--[10]  cAC
output(10) <= '0';

end architecture;