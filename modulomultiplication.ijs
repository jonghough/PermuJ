0 :0
Script defines modulo multiplication groups.
The modulo multiplication group for a positive integer
N, is the multiplicative group of all elements of
Z/NZ coprime to N. Order of the group is Phi(N), where
Phi is the totient function.
@author Jon Hough
@since 13 Nov 2014
)

NB.Totient function
totient=: 5&p:

NB.Modulo multiplication group for odd prime power.
mmg_oddp=: Cyc @: totient
NB.Modulo multiplication group for powers of 2.
mmg_2pow=: verb define
grp=. 0
if. y = 2 do.
  grp=. 0
elseif. y = 4 do.
  grp=. Cyc 2
elseif. 1 do.
  pow=. 1&{"2 decompose y
  p=. 2 ^ (pow - 2)
  grp=. (Cyc 2) dir_prod (Cyc p)
end.
grp
)
NB.Switch for odd and even cases.
mmg_switch=: mmg_oddp`mmg_2pow@.(0&=@:(2&|))
NB.Decomposes positive integer y into prime factors and powers.
decompose=: 2&p:
NB.Calculates the modulo multiplication group for composite integer.
mmg_composite=: verb define
grp=. 0
d=. ^/@:decompose y
d=. d -. 2 NB. remove 2 as modulo multiplication group is identity.
NB. special case for 2.
if. d = 2 do.0
else.(mmg_switch"0&.>)@:( <"0) d
end.
)
NB.Calculates the Modulo multiplication group for positive integer y.
NB.Returns boxed list of Cyclic groups.
calculate_mmg=: mmg_composite
NB.Generates the permutation set isomorphic to the modulo multiplication
NB.group for the positive integer y.
generate_mmg=: >@:((dir_prod &.>)/) @: calculate_mmg
NB.Returns a boxed list of group names, isomorphic to the direct product factors
NB.of the modulo multiplication group of integer y.
NB.e.g. if y = 10 should return, (as box), Cyc 4.
mmg_groupnames=: (decompose_directproduct &. >) @: calculate_mmg