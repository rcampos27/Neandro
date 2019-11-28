library ieee;
use ieee.std_logic_1164.all;

entity TB_PC_2 is
end entity;

architecture behavior of TB_PC_2 is

component PC is
    port(
		E : in std_logic_vector(7 downto 0);
		clock, clear, selADD_BARR, cPC : in std_logic;
		S : out std_logic_vector(7 downto 0)
    );
end component;


signal sE, sS: std_logic_vector(7 downto 0);
signal selADD_BARR, clear, clock, scPC, sCG : std_logic;

begin

u_pc : PC
port map(sE, clock, clear, selADD_BARR, scPC, sS);

process
begin

    sE <= "11110000";

	clear <= '0';
	scPC <= '0';
	clock <= '0';
    selADD_BARR <= '0';
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;

    clear <= '1';
    clock <= '0';
	wait for 10 ns;

	clock <= '1';
	wait for 10 ns;

   	clock <= '0';
	wait for 10 ns;


-- pc++
    scPC <= '1';
    selADD_BARR <= '0';
	clock <= '1';
	wait for 10 ns;

    scPC <= '0';
   	clock <= '0';
	wait for 10 ns;

	clock <= '1';
	wait for 10 ns;

   	clock <= '0';
	wait for 10 ns;


-- pc++
    scPC <= '1';
    selADD_BARR <= '0';
	clock <= '1';
	wait for 10 ns;

    scPC <= '0';
   	clock <= '0';
	wait for 10 ns;

	clock <= '1';
	wait for 10 ns;

   	clock <= '0';
	wait for 10 ns;

-- barr
    scPC <= '0';
    selADD_BARR <= '1'; -- NÃO PODE cPC JUNTO COM selADD_BARR
	clock <= '1';
	wait for 10 ns;

    scPC <= '1';
   	clock <= '0';
	wait for 10 ns;

    scPC <= '1';
	clock <= '1';
	wait for 10 ns;

   	clock <= '0';
	wait for 10 ns;



    wait;
end process;
end architecture;
