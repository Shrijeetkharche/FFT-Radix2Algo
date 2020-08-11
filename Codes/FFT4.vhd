library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use work.Complex_Package.ALL;

entity FFT4 is
	port(
		-- Input flag in the time area.
			x4 : in CMPLX_Array4;
		-- Yield flag in the recurrence area.
			y4 : out CMPLX_Array4
	);
end FFT4;

architecture STR of FFT4 is

	component Butterfly_Stage is
		port(
				p, q : in complex; 	-- Inputs.
				W : in complex; 		-- Twiddle factor i.e. W_N = e^(-j*2*pi/N)
											--							Where, N = Number of input points
				r, s : out complex 	-- Outputs.
			);
	end component;
		
	
-- Defining Intermediate Signals.
	signal t1 : CMPLX_Array4 := (others => (0.0, 0.0));
	
	constant W4 : CMPLX_Array2  := ( (1.0, 0.0), (0.0, -1.0) );
	
begin

	-- 4 point DFT
	-- First Butterfly Stage.
		BS411 : Butterfly_Stage port map(x4(0), x4(2), W4(0), t1(0), t1(1));
		BS412 : Butterfly_Stage port map(x4(1), x4(3), W4(0), t1(2), t1(3));
	-- Second Butterfly Stage.
		BS421 : Butterfly_Stage port map(t1(0), t1(2), W4(0), y4(0), y4(2));
		BS422 : Butterfly_Stage port map(t1(1), t1(3), W4(1), y4(1), y4(3));

end STR;

