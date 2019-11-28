library ieee;
use ieee.std_logic_1164.all;


entity TB_ULA is
end entity;

architecture behavior of TB_ULA is
component ULA is
port (
	X, Y                : in  std_logic_vector(7 downto 0);
	selOP               : in  std_logic_vector(2 downto 0);
	flags               : out std_logic_vector(1 downto 0);
	S                   : out std_logic_vector(7 downto 0);
	clear, clock, cFlag : in std_logic

);
end component;
signal sX, sY, sS  : std_logic_vector(7 downto 0);
signal sOP         : std_logic_vector(2 downto 0);
signal sflags      : std_logic_vector(1 downto 0);
signal sclear, sclock, scFlag : std_logic;

begin

u_ULA : ULA 
port map(sX, sY, sOP, sflags, sS, sclear, sclock, scFlag);
process
begin
	sclear <= '1';
	sX <= "00001001";
	sY <= "00100001";
	scFlag <= '1';
	sOP <= "000";
	sclock <= '0';
	wait for 10 ns;

	sclock <= '1';
	wait for 10 ns;

	sclear <= '0';
	sOP <= "001";
	sclock <= '0';
	wait for 10 ns;

	sclock <= '1';
	wait for 10 ns;



	sOP <= "010";
	sclock <= '0';
	wait for 10 ns;

	sclock <= '1';
	wait for 10 ns;


	sOP <= "011";
	sclock <= '0';
	wait for 10 ns;

	sclock <= '1';
	wait for 10 ns;


	sOP <= "100";
	sclock <= '0';
	wait for 10 ns;

	sclock <= '1';
	wait for 10 ns;

end process;
end architecture;
