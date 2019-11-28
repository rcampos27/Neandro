library ieee;
use ieee.std_logic_1164.all;

entity meioSomador_1b is
port(
-- Entradas
	A, B      : in  std_logic;	
-- Saidas
	S, Cout   : out std_logic
);
end entity;

architecture behavior of meioSomador_1b is

begin
	S    <= (A xor B);
	Cout <= (A and B);
end architecture;
