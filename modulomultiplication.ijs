0 :0
Script defines modulo multiplication groups.
The modulo multiplication group for a positive integer
N, is the multiplicative group of all elements of
Z/NZ coprime to N. Order of the group is Phi(N), where
Phi is the totient function.
@author Jon Hough
@since 13 Nov 2014
)

0 :0
Totient function
)
totient =: 5&p:

0 :0
Modulo multiplication group for odd prime power.
)
mmg_oddp =:  Cyc @: totient

0 :0
Modulo multiplication group for powers of 2.
)
mmg_2pow =: verb define
grp =: 0
if. y = 2 do.
	grp =: 0
elseif. y = 4 do.
	grp =: Cyc 2
elseif. 1 do.
	pow =: 1&{"2 decompose y
	p =: 2 ^ (pow - 2)
	grp =: (Cyc 2) dir_prod (Cyc p)
end.
grp
)

0 : 0
Switch for odd and even cases.
)
mmg_switch =: mmg_oddp`mmg_2pow@.(0&=@:(2&|))

0 : 0
Decomposes positive integer y into prime factors and powers.
)
decompose =: 2&p:

0 :0
Calculates the modulo multiplication group for composite integer.
)
mmg_composite =: verb define
grp =: 0
d =: ^/@:decompose y
list =: (mmg_switch"0&.>)@:( <"0) d
list
)

0 : 0
Calculates the Modulo multiplication group for positive integer y.
Returns boxed list of Cyclic groups.
)
calculate_mmg =: mmg_composite 


0 : 0
Returns a boxed list of group names, isomorphic to the direct product factors
of the modulo multiplication group of integer y.
e.g. if y = 10 should return, (as box), Cyc 4.
)
mmg_groupnames =: (decompose_directproduct &. >) @: calculate_mmg