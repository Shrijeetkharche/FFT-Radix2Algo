library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use work.Complex_Package.ALL;

entity FFT2 is
	port(
		-- Input flag in the time area.
			x2 : in CMPLX_Array2; 
		-- Yield flag in the recurrence area.
			y2 : out CMPLX_Array2 
	);
end FFT2;

architecture STR of FFT2 is

	component Butterfly_Stage is
		port(
				p, q : in complex; 	-- Inputs.
				W : in complex; 		-- Twiddle factor i.e. W_N = e^(-j*2*pi/N)
											--							Where, N = Number of input points
				r, s : out complex 	-- Outputs.
			);
	end component;
	
	constant W2 : complex   := (1.0, 0.0) ;
	
begin

	-- 2 point DFT
		BS211 : Butterfly_Stage port map(x2(0), x2(1), W2, y2(0), y2(1));
	
end STR;

