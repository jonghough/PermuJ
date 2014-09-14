NB. Automorphisms of permutation groups.
NB. @author Jon Hough
NB. @since 16 July 2014


NB. Returns the automorphism group of group y.
NB. Returns 0 if automorphism group is unkown.
auto =: 3 : 0
ord =. # y
NB. If y is cyclic and has order 2,4 a prime power or twice 
NB. a prime power then the automorphism group is isomoephic
NB. to the cyclic group of order phi(y).
if. is_cyclic y do.
	phi 	=: totient ord
	primes 	=: q: ord

	if. (ord = 2) +. ( ord = 4) do.
		aut =: Cyc phi
		aut
	elseif. (1 = (2 e. primes) ) *. ((# primes) = 2) do.
		aut =: Cyc phi
		aut
	elseif. (0 = (2 e. primes) ) *. ((# primes) = 1) do.
		aut =: Cyc phi
		aut
	elseif. 1 do.
		0
	end.
NB. If y is symmetric then automorphism group is isomorophic
NB. to itself if order of y is not 1, 2, or 6.
NB. |y| = 6, is a special case with aut(y) = Sym(6) semi-direct
NB. product with Sym(2).
elseif. is_symmetric y do.
	if. 0 = (ord e. 1 2 6) do.
		aut =: y
		aut
	elseif.  1 = (ord e. 1 2) do.
		aut =: 0 NB. trivial group
		aut
	elseif. 1 do.
		_1 NB. TODO case where order is 6
	end.
NB. If y is alternating then automorphism group is isomorphic
NB. to Sym(|y|) if |y| > 3 and |y| != 6. If |y| =3 then aut
NB. is Cyclic group of order 2. 
NB. |y| = 6, is a special case with aut(y) = Sym(6) semi-direct
NB. product with Sym(2).
elseif. is_alternating y do.
	if. (ord > 3) *. ((ord = 6) = 0) do.
		aut =: Sym ord NB. symmetric group on ord letters.
		aut
	elseif.  1 = (ord e. 1 2) do.
		aut =: 0 NB. trivial group
		aut
	elseif. ord = 3 do.
		aut =: Sym 2
		aut
	elseif. ord = 6 do.
		_1 NB. TODO case where order is 6
	end.
elseif. 1 do.
	_1
end.
)


NB. Euler totient function
totient=: (- ~:)&.q:

