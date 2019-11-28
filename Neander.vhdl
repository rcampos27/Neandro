library ieee;
use ieee.std_logic_1164.all;


entity Neander is
port (
    CLK, CLEAR : in std_logic
);
end entity;

architecture behavior of Neander is

-- PC
component PC is
    port(
		E : in std_logic_vector(7 downto 0);
		clock, clear, selADD_BARR, cPC : in std_logic;
		S : out std_logic_vector(7 downto 0)
    );
end component;

-- AC, REM, RDM, RI
component registrador_8b is
    port(
        b               : in std_logic_vector(7 downto 0);
	    c, clock, clear : in  std_logic;
        Q               : out std_logic_vector(7 downto 0)    
    );
end component;

-- multiplexador
component mux_2x8 is
    port(
        I0, I1 : in  std_logic_vector(7 downto 0);
        Sel    : in std_logic; 
        S      : out std_logic_vector(7 downto 0)
    );
end component;

component ULA is
    port (
	    X, Y                : in  std_logic_vector(7 downto 0);
	    selOP               : in  std_logic_vector(2 downto 0);
	    flags               : out std_logic_vector(1 downto 0);
	    S                   : out std_logic_vector(7 downto 0);
	    clear, clock, cFlag : in std_logic
    );
end component;

-- decodificador
component decoder is
    port(
        E   : in std_logic_vector(3 downto 0); --4 entradas
        S   : out std_logic_vector(10 downto 0) --11 saidas
    );
end component;

--Memória
component as_ram is
	port(
		addr  : in    std_logic_vector(7 downto 0);
		data  : inout std_logic_vector(7 downto 0);
		rnotw : in    std_logic; --sinal de leitura e escrita
		notcs : in    std_logic
	);
end component as_ram;

-- BLOCK
signal sBlock, sNBlock : std_logic;

signal selPC_BARR : std_logic;
signal sFlags : std_logic_vector (1 downto 0);
signal selOP_ULA : std_logic_vector (2 downto 0);
signal sBARR : std_logic_vector(7 downto 0);

-- sinais do PC
signal sselADD_BARR, scPC : std_logic;
signal sPC: std_logic_vector(7 downto 0);

-- sinais da memoria
signal sMem : std_logic_vector(7 downto 0);
signal srnotw, snotcs : std_logic;

--sinal do decodificador
signal sDecoder: std_logic_vector(10 downto 0);

signal smux, sRDM, sREM, sRI, sAC, sULA: std_logic_vector(7 downto 0);
signal cREM, cRDM, cRI, cAC : std_logic;
signal high_RI : std_logic_vector(3 downto 0);

begin

u_PC : PC
port map(sBARR, CLK, CLEAR, sselADD_BARR, scPC, sPC);

u_mux2x8 : mux_2x8
port map(sPC, sBARR, selPC_BARR, sMUX);

u_REM : registrador_8b
port map(sMUX, cREM, CLK, CLEAR, sREM);

u_MEM : as_ram
port map(sREM, sMem, srnotw, snotcs);

u_RDM : registrador_8b
port map(sMEM, cRDM, CLK, CLEAR, sRDM);

--primeiro block
sBARR <= sRDM when sBlock = '1' else (others => 'Z');

--segundo block
sMem <= sRDM when sNBlock = '1' else (others => 'Z');

u_RI : registrador_8b
port map(sBARR, cRI, CLK, CLEAR, sRI);


high_RI(3) <= sRI(7);
high_RI(2) <= sRI(6);
high_RI(1) <= sRI(5);
high_RI(0) <= sRI(4);

u_decoder : decoder
port map(high_RI, sDecoder);

u_ULA : ULA 
port map(sBARR, sAC, selOP_ULA, sFlags, sULA, CLEAR, CLK, cAC);


u_AC : registrador_8b
port map(sULA, cAC, CLK, CLEAR, sAC);

--terceiro block
sBARR <= sAC when sNBlock = '1' else (others => 'Z');

end architecture;
