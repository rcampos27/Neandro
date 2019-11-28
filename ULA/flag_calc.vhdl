library ieee;
use ieee.std_logic_1164.all;


entity flag_calc is
port (
	E     : in  std_logic_vector(7 downto 0);
	flags : out std_logic_vector(1 downto 0);
	clear, clock, cFlag : in std_logic
);
end entity;

architecture behavior of flag_calc is

component registrador_2b is
    port(
        b               : in std_logic_vector(1 downto 0);
	c, clock, clear : in  std_logic;
        Q               : out std_logic_vector(1 downto 0)    
    );
end component;
signal nE         : std_logic_vector(7 downto 0);
signal sflags, sS : std_logic_vector(1 downto 0);
begin	
	nE <= not E;
	sflags(0) <= E(7);
	sflags(1) <= nE(7) and nE(6) and nE(5) and nE(4) and nE(3) and nE(2) and nE(1) and nE(0);

	u_reg_flag : registrador_2b 
	port map(sflags, cFlag, clock, clear, sS);
	flags <= sS;
end architecture;
