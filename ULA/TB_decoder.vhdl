library ieee;
use ieee.std_logic_1164.all;


entity TB_decoder is
end entity;

architecture behavior of TB_decoder is

component decoder is
port (
	selOP : in  std_logic_vector(2 downto 0);
	code  : out std_logic_vector(4 downto 0)
);
end component;
signal sSel  :  std_logic_vector(2 downto 0);
signal sCode :  std_logic_vector(4 downto 0);

begin
	u_decoder : decoder
	port map(sSel, sCode);
process
begin

	sSel <= "000";
	wait for 10 ns;
	sSel <= "001";
	wait for 10 ns;
	sSel <= "010";
	wait for 10 ns;
	sSel <= "011";
	wait for 10 ns;
	sSel <= "100";
	wait for 10 ns;
	sSel <= "000";
	wait for 10 ns;
end process;
end architecture;
