library ieee;
use ieee.std_logic_1164.all;


entity and_8b is
port (
	A, B : in  std_logic_vector(7 downto 0);
	S    : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of and_8b is

begin
	S <= A and B;
end architecture;
