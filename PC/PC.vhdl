library ieee;
use ieee.std_logic_1164.all;

entity PC is
    port(
		E : in std_logic_vector(7 downto 0);
		clock, clear, selADD_BARR, cPC : in std_logic;
		S : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of PC is

component mux_2x8 is
    port(
        I0, I1 : in  std_logic_vector(7 downto 0);
        Sel    : in std_logic; 
        S      : out std_logic_vector(7 downto 0)
    );

end component;

component registrador_8b is
	port(
    	b               : in std_logic_vector(7 downto 0);
		c, clock, clear : in  std_logic;
    	Q               : out std_logic_vector(7 downto 0)    
    );
end component;

component somador_8b is
	port (
		A, B  : in  std_logic_vector(7 downto 0);
		S     : out std_logic_vector(7 downto 0);
		CoutG : out std_logic
	);
end component;

signal sReg, sAdder, sMUX : std_logic_vector(7 downto 0);
signal sCout : std_logic;

begin

u_registrador : registrador_8b
port map(sMUX, cPC, clock, clear, sReg);

u_adder : somador_8b
port map("00000001", sReg, sAdder, sCout);

u_mux : mux_2x8
port map(sAdder, E, selADD_BARR, sMUX);
  
S <= sReg;

end architecture;
