library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use work.Complex_Package.ALL;

entity FFT8 is
	port(
		-- Input flag in the time area.
			x8 : in CMPLX_Array8;
		-- Yield flag in the recurrence area.
			y8 : out CMPLX_Array8
	);
end FFT8;

architecture STR of FFT8 is

	component Butterfly_Stage is
		port(
				p, q : in complex; 	-- Inputs.
				W : in complex; 		-- Twiddle factor i.e. W_N = e^(-j*2*pi/N)
											--							Where, N = Number of input points
				r, s : out complex 	-- Outputs.
			);
	end component;
		
	
-- Defining Intermediate Signals.
	signal t2,t3 : CMPLX_Array8 := (others => (0.0, 0.0));	
	
	constant W8 : CMPLX_Array4  := ( (1.0, 0.0), (0.7071, -0.7071), (0.0, -1.0), (-0.7071, -0.7071) );
	
begin
 
	-- 8 point DFT
	-- First Butterfly Stage.
		BS811 : Butterfly_Stage port map(x8(0), x8(4), W8(0), t2(0), t2(1));
		BS812 : Butterfly_Stage port map(x8(2), x8(6), W8(0), t2(2), t2(3));
		BS813 : Butterfly_Stage port map(x8(1), x8(5), W8(0), t2(4), t2(5));
		BS814 : Butterfly_Stage port map(x8(3), x8(7), W8(0), t2(6), t2(7));
		
	-- Second Butterfly Stage.
		BS821 : Butterfly_Stage port map(t2(0), t2(2), W8(0), t3(0), t3(2));
		BS822 : Butterfly_Stage port map(t2(1), t2(3), W8(2), t3(1), t3(3));
		BS823 : Butterfly_Stage port map(t2(4), t2(6), W8(0), t3(4), t3(6));
		BS824 : Butterfly_Stage port map(t2(5), t2(7), W8(2), t3(5), t3(7));
		
	-- Third Butterfly Stage.
		BS831 : Butterfly_Stage port map(t3(0), t3(4), W8(0), y8(0), y8(4));
		BS832 : Butterfly_Stage port map(t3(1), t3(5), W8(1), y8(1), y8(5));
		BS833 : Butterfly_Stage port map(t3(2), t3(6), W8(2), y8(2), y8(6));
		BS834 : Butterfly_Stage port map(t3(3), t3(7), W8(3), y8(3), y8(7));


end STR;

