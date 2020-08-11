library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use work.Complex_Package.ALL;

entity FFT16 is
	port(
		-- Input flag in the time area.
			x16 : in CMPLX_Array16;
		-- Yield flag in the recurrence area.
			y16 : out CMPLX_Array16
	);
end FFT16;

architecture STR of FFT16 is

	component Butterfly_Stage is
		port(
				p, q : in complex; 	-- Inputs.
				W : in complex; 		-- Twiddle factor i.e. W_N = e^(-j*2*pi/N)
											--							Where, N = Number of input points
				r, s : out complex 	-- Outputs.
			);
	end component;
		
	
-- Defining Intermediate Signals.
	signal t4,t5,t6 : CMPLX_Array16 := (others => (0.0, 0.0));
	
	constant W16 : CMPLX_Array8 := ( (1.0, 0.0), (0.7071, -0.7071), (0.0, -1.0), (-0.7071, -0.7071), 
												(0.9239, -0.3827), (0.3827, -0.9239), (-0.3827, -0.9239), (-0.9239, -0.3827) );
	
begin

	-- 16 point DFT
	-- First Butterfly Stage.
		BS1611 : Butterfly_Stage port map(x16(0), x16(8), W16(0), t4(0), t4(1));
		BS1612 : Butterfly_Stage port map(x16(4), x16(12), W16(0), t4(2), t4(3));
		BS1613 : Butterfly_Stage port map(x16(2), x16(10), W16(0), t4(4), t4(5));
		BS1614 : Butterfly_Stage port map(x16(6), x16(14), W16(0), t4(6), t4(7));
		BS1615 : Butterfly_Stage port map(x16(1), x16(9), W16(0), t4(8), t4(9));
		BS1616 : Butterfly_Stage port map(x16(5), x16(13), W16(0), t4(10), t4(11));
		BS1617 : Butterfly_Stage port map(x16(3), x16(11), W16(0), t4(12), t4(13));
		BS1618 : Butterfly_Stage port map(x16(7), x16(15), W16(0), t4(14), t4(15));
		
	-- Second Butterfly Stage.
		BS1621 : Butterfly_Stage port map(t4(0), t4(2), W16(0), t5(0), t5(2));
		BS1622 : Butterfly_Stage port map(t4(1), t4(3), W16(2), t5(1), t5(3));
		BS1623 : Butterfly_Stage port map(t4(4), t4(6), W16(0), t5(4), t5(6));
		BS1624 : Butterfly_Stage port map(t4(5), t4(7), W16(2), t5(5), t5(7));
		BS1625 : Butterfly_Stage port map(t4(8), t4(10), W16(0), t5(8), t5(10));
		BS1626 : Butterfly_Stage port map(t4(9), t4(11), W16(2), t5(9), t5(11));
		BS1627 : Butterfly_Stage port map(t4(12), t4(14), W16(0), t5(12), t5(14));
		BS1628 : Butterfly_Stage port map(t4(13), t4(15), W16(2), t5(13), t5(15));

	-- Third Butterfly Stage.
		BS1631 : Butterfly_Stage port map(t5(0), t5(4), W16(0), t6(0), t6(4));
		BS1632 : Butterfly_Stage port map(t5(1), t5(5), W16(1), t6(1), t6(5));
		BS1633 : Butterfly_Stage port map(t5(2), t5(6), W16(2), t6(2), t6(6));
		BS1634 : Butterfly_Stage port map(t5(3), t5(7), W16(3), t6(3), t6(7));
		BS1635 : Butterfly_Stage port map(t5(8), t5(12), W16(0), t6(8), t6(12));
		BS1636 : Butterfly_Stage port map(t5(9), t5(13), W16(1), t6(9), t6(13));
		BS1637 : Butterfly_Stage port map(t5(10), t5(14), W16(2), t6(10), t6(14));
		BS1638 : Butterfly_Stage port map(t5(11), t5(15), W16(3), t6(11), t6(15));

	-- Fourth Butterfly Stage.
		BS1641 : Butterfly_Stage port map(t6(0), t6(8), W16(0), y16(0), y16(8));
		BS1642 : Butterfly_Stage port map(t6(1), t6(9), W16(4), y16(1), y16(9));
		BS1643 : Butterfly_Stage port map(t6(2), t6(10), W16(1), y16(2), y16(10));
		BS1644 : Butterfly_Stage port map(t6(3), t6(11), W16(5), y16(3), y16(11));
		BS1645 : Butterfly_Stage port map(t6(4), t6(12), W16(2), y16(4), y16(12));
		BS1646 : Butterfly_Stage port map(t6(5), t6(13), W16(6), y16(5), y16(13));
		BS1647 : Butterfly_Stage port map(t6(6), t6(14), W16(3), y16(6), y16(14));
		BS1648 : Butterfly_Stage port map(t6(7), t6(15), W16(7), y16(7), y16(15));

end STR;

