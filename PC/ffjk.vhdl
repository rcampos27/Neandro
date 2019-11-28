library ieee;
use ieee.std_logic_1164.all;

entity ffjk is 
    port (  
        J, K, clock   : in  std_logic;
        preset, clear : in std_logic;
        Q, nQ         : out std_logic
    );
end entity;

architecture behavior of ffjk is
    component nand_3in is
        port (
            A, B, C : in  std_logic;
            Snand   : out std_logic
        );
    end component;
--MASTER
--J
    signal sSmj1, sSmj2 : std_logic;
--K
    signal sSmk1, sSmk2 : std_logic;
--SLAVE
--J 
    signal sSsj1, sSJ   : std_logic;
--K 
    signal sSsk1, sSK   : std_logic;

begin
    
    mj1 : nand_3in
        port map(J, clock, sSK, sSmj1);
    mj2 : nand_3in
        port map(preset, sSmj1, sSmk2, sSmj2);
    
    mk1 : nand_3in
        port map(K, clock, sSJ, sSmk1);
    mk2 : nand_3in
        port map(clear, sSmk1, sSmj2, sSmk2);

    sj1 : sSsj1 <= (not clock) nand sSmj2;
    uJ   : nand_3in
        port map(preset, sSsj1, sSK, sSJ);

    sk1 : sSsk1 <= (not clock) nand sSmk2;
    uK   : nand_3in
        port map(clear, sSsk1, sSJ, sSK);

	Q  <= sSJ;
	nQ <= sSK;
end architecture;
