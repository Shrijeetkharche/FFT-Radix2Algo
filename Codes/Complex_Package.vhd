library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Complex_Package is

-- Defining a complex datatype.
	type complex is 
		record
		Re : real;
		Im : real;
		end record;
	
-- Defining a collection of the structure as an array of datatype 'complex'.
	type CMPLX_Array16 is array (0 to 15) of complex;
	type CMPLX_Array8 is array (0 to 7) of complex;
	type CMPLX_Array4 is array (0 to 3) of complex;
	type CMPLX_Array2 is array (0 to 1) of complex;
	
-- Defining functions for arithmetic operations of complex numbers.
	function Add(a, b: complex) return complex;
	function Sub(a, b: complex) return complex;
	function Mul(a, b: complex) return complex;
	
end Complex_Package;

package body Complex_Package is

-- Addition of Complex Numbers.
	function Add(a, b: complex) return complex is
		variable Sum : complex;
		
		begin
			Sum.Re := a.Re + b.Re;
			Sum.Im := a.Im + b.Im;
		return Sum;
	end Add;
	
-- Subtraction of Complex Numbers.
	function Sub(a, b: complex) return complex is
		variable Diff : complex;
		
		begin
			Diff.Re := a.Re - b.Re;
			Diff.Im := a.Im - b.Im;
		return Diff;
	end Sub;
	
-- Multiplication of Complex Numbers.
	function Mul(a, b: complex) return complex is
		variable Product : complex;
		
		begin
			Product.Re := (a.Re * b.Re) - (a.Im * b.Im);
			Product.Im := (a.Re * b.Im) + (a.Im * b.Re);
		return Product;
	end Mul;
	
end Complex_Package;
