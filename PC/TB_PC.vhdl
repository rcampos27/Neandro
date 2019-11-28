library ieee;
use ieee.std_logic_1164.all;

entity TB_PC is
end entity;

architecture behavior of TB_PC is

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


signal sE, sS, sR: std_logic_vector(7 downto 0);
signal selADD_BARR, clear, clock, scPC, sCG : std_logic;

begin

--u_adder : somador_8b 
--port map("00000001", sE, sR, sCG);

u_reg : registrador_8b
port map(sE, scPC, clock, clear, sS);

process
begin

	clear <= '0';
	scPC <= '1';
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	clear <= '1';
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	sE <= "00110011";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	sE <= "11001100";
	
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	sE <= "01010101";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	sE <= "10101010";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	
	sE <= "11111111";
	clock <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	

end process;
end architecture;
