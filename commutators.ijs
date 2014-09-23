NB. Functions for finding commutators and
NB. commutator subgroups.
NB. @author Jon Hough
NB. @since 16 July 2014

NB. TODO path to permutationgroups.ijs

NB. Returns the commutator of element x
NB. and element y. [x, y], defined as the product
NB. y^(_1) * x^(_1) * y * x.
commutator =: ( inverse @: ] ) C."(1 1) conjugate


NB. Returns the commutator (derived) subgroup of group y.
derived_subgroup =:  3 : 0
ord  =. # y       NB. order of group y
size =. 0{ #"1 y  NB. size of set acted on

NB. If Group y is symmetric then calculation is pointless.
NB. Return isomorphism of alternating subgroup of y.
NB. Warning: directly computing the commutator subgroup on 
NB. Sym(N) for N >= 7 can crash J, so this 'if block' is necessary.
if. (ord = ! size  ) do.
	alt =. Alt size
	alt
NB. Similar argument for symmetric groups also applies to
NB. alternating groups. For  N > 4, Alt(N) is simple.
NB. So commutator subgroup is itself.
elseif. ( ( ( 2 * ord ) = ! size ) *. (size > 4) ) do.
	grp =. y
	grp
elseif. (1) do.
	( ~. @: ,/ @: (<"1 @: commutator"(_ 1)/~ i.~ <"1@:]) { ] ) y
end.
)


NB. Returns true if group y is perfect.
NB. i.e. y is equal to its commutator subgroup.
is_perfect =: # = ( # @: derived_subgroup )  




NB. ================================================
NB. Derived series
NB. ================================================
NB. derived series termination group
DST =: derived_subgroup^:_

NB. Returns 1 if group y is solvable,
NB. 0 otherwise.
is_solvable =: (1&=)@:#@:DST


derived_series =: verb define
	result =: < 'DERIVED SERIES: '
	ord =: #@:{.
	grp =: y
	ogrp =: _1+ # grp 
	while. 0 = (ogrp = ( # grp)) do.
		o =. ord grp
		or =: # grp
		if. or = 1 do.
			result =: result, <'Identity'
		elseif. is_symmetric grp do.
			result =: result, <( 'Sym ',":o)
		elseif. is_alternating grp do.
			result =: result, <( 'Alt ',":o)
		elseif. is_cyclic grp do.
			result =: result, <( 'Cyc ',":or)
		NB. TODO -- Dihedral case etc.
		elseif. 1 do.
			result =: result, <( '??? ',":o)
		end.
		ogrp =. # grp
		grp =. derived_subgroup grp
	end.
	result
)