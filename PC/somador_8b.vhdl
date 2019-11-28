library ieee;
use ieee.std_logic_1164.all;


entity somador_8b is
port (
	A, B  : in  std_logic_vector(7 downto 0);
	S     : out std_logic_vector(7 downto 0);
	CoutG : out std_logic
);
end entity;

architecture behavior of somador_8b is
component meioSomador_1b is
port(
-- Entradas
	A, B      : in  std_logic;	
-- Saidas
	S, Cout   : out std_logic
);
end component;

component somadorCompleto_1b is
port(
-- Entradas
	A, B, Cin : in  std_logic;	
-- Saidas
	S, Cout   : out std_logic
);
end component;

	signal sC : std_logic_vector(6 downto 0);
begin
	u0 : meioSomador_1b
	port map(
	A => A(0),
	B => B(0),
	Cout => sC(0),
	S => S(0)
	);

	u1 : somadorCompleto_1b
	port map(
	A => A(1),
	B => B(1),
	Cin => sC(0),
	Cout => sC(1),
	S => S(1)
	);

	u2 : somadorCompleto_1b
	port map(
	A => A(2),
	B => B(2),
	Cin => sC(1),
	Cout => sC(2),
	S => S(2)
	);

	u3 : somadorCompleto_1b
	port map(
	A => A(3),
	B => B(3),
	Cin => sC(2),
	Cout => sC(3),
	S => S(3)
	);

	u4 : somadorCompleto_1b
	port map(
	A => A(4),
	B => B(4),
	Cin => sC(3),
	Cout => sC(4),
	S => S(4)
	);

	u5 : somadorCompleto_1b
	port map(
	A => A(5),
	B => B(5),
	Cin => sC(4),
	Cout => sC(5),
	S => S(5)
	);

	u6 : somadorCompleto_1b
	port map(
	A => A(6),
	B => B(6),
	Cin => sC(5),
	Cout => sC(6),
	S => S(6)
	);

	u7 : somadorCompleto_1b
	port map(
	A => A(7),
	B => B(7),
	Cin => sC(6),
	Cout => CoutG,
	S => S(7)
	);
end architecture;
