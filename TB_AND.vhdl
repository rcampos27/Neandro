library ieee;
use ieee.std_logic_1164.all;


entity TB_AND is
end entity;

architecture behavior of TB_AND is
component ANDD is
	port (	
		step   : in  std_logic_vector(2 downto 0);
		output : out std_logic_vector(10 downto 0)
	);
end component;
	signal sstep   : std_logic_vector(2 downto 0);
	signal soutput : std_logic_vector(10 downto 0);
	signal cAC, cPC, selADD_BARR, selPC_BARR, cREM, R_nW, cRDM, cRI : std_logic;
	signal selOP : std_logic_vector(2 downto 0);
begin

	u_and : ANDD
	port map(sstep, soutput);	
	
process
begin 
	sstep <= "000";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	wait for 10 ns;
	sstep <= "001";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);

	wait for 10 ns;
	sstep <= "010";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);

	wait for 10 ns;
	sstep <= "011";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	
	wait for 10 ns;
	sstep <= "100";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	
	wait for 10 ns;
	sstep <= "101";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	
	wait for 10 ns;
	sstep <= "110";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	
	wait for 10 ns;
	sstep <= "111";
	cPC <= soutput(0);
	selADD_BARR <= soutput(1);
	selPC_BARR <= soutput(2);
	cREM <= soutput(3);
	R_nW <= soutput(4);
	cRDM <= soutput(5);
    cRI <= soutput(6);
	selOP(0) <= soutput(7);
	selOP(1) <= soutput(8);
	selOP(2) <= soutput(9);
	cAC <= soutput(10);
	
	wait for 10 ns;

end process;
end architecture;
