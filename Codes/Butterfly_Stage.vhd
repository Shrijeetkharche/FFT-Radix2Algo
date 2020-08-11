library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.Complex_Package.ALL;

entity Butterfly_Stage is
		port(
				p, q : in complex; 	-- Inputs.
				W :in complex; 		-- Twiddle factor i.e. W_N = e^(-j*2*pi/N)
											--							Where, N = Number of input points
				r, s :out complex 	-- Outputs.
			);
end Butterfly_Stage;

architecture BEH of Butterfly_Stage is

begin

-- Butterfly Stage Calculation.
	r <= Add(p, Mul(q, W));
	s <= Sub(p, Mul(q, W));

end BEH;

