library ieee;
use  ieee.std_logic_1164.all;

entity mux_2x8 is
    port(
        I0, I1 : in  std_logic_vector(7 downto 0);
        Sel    : in std_logic; 
        S      : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of mux_2x8 is
    component mux_2x1 is
        port (
            I0, I1, Sel : in  std_logic;
            S           : out std_logic
        );
    end component;
begin
    u0_mux_2x1 : mux_2x1
	port map(I0(0), I1(0), Sel, S(0));
    u1_mux_2x1 : mux_2x1
	port map(I0(1), I1(1), Sel, S(1));
    u2_mux_2x1 : mux_2x1
	port map(I0(2), I1(2), Sel, S(2));
    u3_mux_2x1 : mux_2x1
	port map(I0(3), I1(3), Sel, S(3));
    u4_mux_2x1 : mux_2x1
	port map(I0(4), I1(4), Sel, S(4));
    u5_mux_2x1 : mux_2x1
	port map(I0(5), I1(5), Sel, S(5));
    u6_mux_2x1 : mux_2x1
	port map(I0(6), I1(6), Sel, S(6));
    u7_mux_2x1 : mux_2x1
	port map(I0(7), I1(7), Sel, S(7));
end architecture;
