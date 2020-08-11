LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.ALL;
USE work.Complex_Package.ALL;

ENTITY tb_FFT IS
END tb_FFT;
 
ARCHITECTURE behavior OF tb_FFT IS 

   -- Inputs
		signal x2 :  CMPLX_Array2; 
		signal x4 :  CMPLX_Array4;
		signal x8 :  CMPLX_Array8;
		signal x16 :  CMPLX_Array16;


 	-- Outputs
		signal y2 :  CMPLX_Array2; 
		signal y4 :  CMPLX_Array4;
		signal y8 :  CMPLX_Array8;
		signal y16 :  CMPLX_Array16;   
		
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut2: entity  work.FFT2 PORT MAP (
											 x2 => x2,
											 y2 => y2
										  );
										  
	uut4: entity  work.FFT4 PORT MAP (
											 x4 => x4,
											 y4 => y4
										  );
	
	uut8: entity  work.FFT8 PORT MAP (
											 x8 => x8,
											 y8 => y8
										  );
	
	uut16: entity  work.FFT16 PORT MAP (
											 x16 => x16,
											 y16 => y16
										  );
   -- Stimulus process
   stim_proc2: process
   begin		
	-- Sample inputs in time domain.
		x2(0) <= (1.0,0.0);
		x2(1) <= (2.0,0.0);

		x4(0) <= (4.0,0.0);
		x4(1) <= (3.0,0.0);
		x4(2) <= (2.0,0.0);
		x4(3) <= (1.0,0.0);

		x8(0) <= (1.0,0.0);
		x8(1) <= (2.0,0.0);
		x8(2) <= (3.0,0.0);
		x8(3) <= (4.0,0.0);
		x8(4) <= (5.0,0.0);
		x8(5) <= (6.0,0.0);
		x8(6) <= (7.0,0.0);
		x8(7) <= (8.0,0.0);

		x16(0) <= (1.0,0.0);
		x16(1) <= (2.0,0.0);
		x16(2) <= (3.0,0.0);
		x16(3) <= (4.0,0.0);
		x16(4) <= (5.0,0.0);
		x16(5) <= (6.0,0.0);
		x16(6) <= (7.0,0.0);
		x16(7) <= (8.0,0.0);
		x16(8) <= (9.0,0.0);
		x16(9) <= (10.0,0.0);
		x16(10) <= (11.0,0.0);
		x16(11) <= (12.0,0.0);
		x16(12) <= (13.0,0.0);
		x16(13) <= (14.0,0.0);
		x16(14) <= (15.0,0.0);
		x16(15) <= (16.0,0.0);
      wait;
   end process;

END;
