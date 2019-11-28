library ieee;
use ieee.std_logic_1164.all;


entity ULA is
port (
	X, Y                : in  std_logic_vector(7 downto 0);
	selOP               : in  std_logic_vector(2 downto 0);
	flags               : out std_logic_vector(1 downto 0);
	S                   : out std_logic_vector(7 downto 0);
	clear, clock, cFlag : in std_logic

);
end entity;

architecture behavior of ULA is
-- NOT
component not_8b is
port (
	A : in  std_logic_vector(7 downto 0);
	S : out std_logic_vector(7 downto 0)
);
end component;

-- OR
component or_8b is
port (
	A,B  : in  std_logic_vector(7 downto 0);
	S    : out std_logic_vector(7 downto 0)
);
end component;

-- AND
component and_8b is
port (
	A, B : in  std_logic_vector(7 downto 0);
	S    : out std_logic_vector(7 downto 0)
);
end component;

-- ADDER
component somador_8b is
port (
	A, B  : in  std_logic_vector(7 downto 0);
	S     : out std_logic_vector(7 downto 0);
	CoutG : out std_logic
);
end component;

-- DECODER
component decoder_ULA is
port (
	selOP : in  std_logic_vector(2 downto 0);
	code  : out std_logic_vector(4 downto 0)
);
end component;

-- FLAG CALC
component flag_calc is
port (
	E     : in  std_logic_vector(7 downto 0);
	flags : out std_logic_vector(1 downto 0);
	clear, clock, cFlag : in std_logic
);
end component;

-- SAIDAS DOS COMPONENTES E SAIDA GERAL (sS)
signal sNot, sOr, sAnd, sAdd, sLDA, sS : std_logic_vector(7 downto 0);
-- SINAL SAIDA DO DECODER
signal sDecode                         : std_logic_vector(4 downto 0);
-- SINAL SAIDA DAS FLAGS N(0)/Z(1)
signal sFlag                           : std_logic_vector(1 downto 0);
begin

u_not : not_8b
port map(X, sNot);

u_or : or_8b
port map(X, Y, sOr);

u_and : and_8b
port map(X, Y, sAnd);

u_add : somador_8b
port map(X, Y, sAdd);

u_decoder : decoder_ULA
port map(selOP, sDecode);

u_flag : flag_calc
port map(sS, sFlag, clear, clock, cFlag);

sS <= sNot when sDecode(0) = '1' else (others => 'Z');
sS <= sOr  when sDecode(1) = '1' else (others => 'Z');
sS <= sAnd when sDecode(2) = '1' else (others => 'Z');
sS <= sAdd when sDecode(3) = '1' else (others => 'Z');
sS <= Y    when sDecode(4) = '1' else (others => 'Z');


S <= sS;
end architecture;
