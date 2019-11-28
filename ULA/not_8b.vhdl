library ieee;
use ieee.std_logic_1164.all;


entity not_8b is
port (
	A : in  std_logic_vector(7 downto 0);
	S : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of not_8b is

begin
	S <= not A;
end architecture;
