library ieee;
use ieee.std_logic_1164.all;


entity decoder_ULA is
port (
	selOP : in  std_logic_vector(2 downto 0);
	code  : out std_logic_vector(4 downto 0)
);
end entity;

architecture behavior of decoder_ULA is

signal nselOP : std_logic_vector(2 downto 0);

begin
	nselOP <= not selOP;

	code(0) <= nselOP(2) and nselOP(1) and nselOP(0);
	code(1) <= nselOP(2) and nselOP(1) and selOP(0);
	code(2) <= nselOP(2) and selOP(1)  and nselOP(0);
	code(3) <= nselOP(2) and selOP(1)  and selOP(0);
	code(4) <= selOP(2)  and nselOP(1) and nselOP(0);

end architecture;
