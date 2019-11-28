library ieee;
use ieee.std_logic_1164.all;

entity somadorCompleto_1b is
port(
-- Entradas
	A, B, Cin : in  std_logic;	
-- Saidas
	S, Cout   : out std_logic
);
end entity;

architecture behavior of somadorCompleto_1b is
begin
	S    <= (A xor B) xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin); 
end architecture;
