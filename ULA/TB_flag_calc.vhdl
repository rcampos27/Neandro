library ieee;
use ieee.std_logic_1164.all;


entity TB_flag_calc is
end entity;

architecture behavior of TB_flag_calc is

component flag_calc is
port (
	E     : in  std_logic_vector(7 downto 0);
	flags : out std_logic_vector(1 downto 0);
	clear, clock, cFlag : in std_logic
);
end component;
signal sE  : std_logic_vector(7 downto 0);
signal sFlag : std_logic_vector(1 downto 0);
signal clear, clock, cFlag : std_logic;

begin
	u_flag : flag_calc
	port map(sE, sFlag, clear, clock, cFlag);
process
begin
	clear <= '0';
	clock <= '0';
	cFlag <= '0';
	sE <= "11111111";
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

	clear <= '1';
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	cFlag <= '1';
	sE <= "00000000";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

	cFlag <= '0';
	sE <= "11111111";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

	cFlag <= '1';
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

	cFlag <= '0';
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

end process;
end architecture;

