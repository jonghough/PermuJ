0 : 0 
Script contains various Permutation Group Theory
related verbs.
@author Jon Hough
@since 10 July 2014
)

NB. -----------------------------------------
NB. Verbs for generating groups
NB. -----------------------------------------


NB. Generate Symmetric Group of order y
Sym =: (i. @: !) A. i.


NB. Generate Alternating group of order y
Alt =: ( (I. @: (1&=) @: (C.!.2)) { ] ) @: Sym


NB. Generate Cyclic Group of order y
Cyc =: i. |."(0 1) i.


NB. Generate Dihedral Group of order y.
NB. i.e. generated group has y permutations. 
NB. (Notation D_n, or D_2n)
Dih =: ( (|. @: (0&{) ) ( (C."(_ 1) ) ,~ ]) ]) @: Cyc


NB. -----------------------------------------
NB. Verbs for elements of groups
NB. -----------------------------------------


NB. Get the order of permutation
order =: *./ @ (# & >"_) @ C.


NB. Get inverse of permutation
inverse =: /:


NB. Returns 1 if y is identity element,
NB. reutrns 0 otherwise.
is_identity =: < = ( < @: C./~ )


NB. Gets the identity element's index in group y.
get_identity =: I. @:( is_identity"1 )


NB. Conjugates y by x. i.e. calculates permutation
NB. equal to x^(_1)*y*x.
conjugate =: (([: /:"1 [) C."(1 1) (C."(1 1)~))


NB. Gives the right cosets of element y in group x.
rcosets =: ~.@:(/:~"2) @:( ] C."(_ 1) [)


NB. Gives the left cosets of element y in group x.
lcosets =: ~.@:(/:~"2) @: ( C."1"1 _ )


NB. Returns the set of right cosets of subgroup y
NB. in group x. 
get_rcosets =: ~.@:( /:~"2 )@:( rcosets"(1 _) )


NB. Gets the right transversals of subgroup y in
NB. group x.
r_transversals =. 0&{"2 @: get_rcosets


NB. -----------------------------------------
NB. Verbs for conjugacy classes
NB. -----------------------------------------


NB. Creates conjugacy class of element y
NB. in group x.
conj_class =: <@:( /:~"2 )@:~. @: conjugate


NB. Gets the conjugacy class output by conjugating
NB. group y with itself. (Will contain multiple copies of
NB. the same conjugacy classes).
conjugate_list =: conj_class"(_ 1)/~


NB. Gets the array of conjugacy classes of the 
NB. given group. Nubs out duplicate arrays in
NB. conjugate_list to give the conjugacy classes.
conjugacy_classes =: ~.@: conjugate_list


NB. Stabilizer of point 0, in group y
stab0 =: ( I. @: (0&=) @: (0&{"1) ) { ]


NB. Stabilizer of point x in group y.
NB. Will fail if x is larger than number of
NB. objects y is permuting.
stabp =:  ( I. @: ( [ =  {"1) ) { ]


NB. Returns the center of group y. Calculates center by
NB. conjugating all elements, i.e. |y|^2 conjugations,
NB. and matches those that leave original element unchanged.
NB. Slow ~ O(n^2).
center =: ( I. @: ( < ="(_ 2 ) ( <"2 @: ( ] conjugate"(1 _) ] ) ) ) ) { ]


NB. Returns 1 if the group, y, is cyclic,
NB. 0 otherwise. Searches for element, g,
NB. such that o(g) = |y|.
NB. Slow. TODO speed up.
is_cyclic =: # e. (order"1)


NB. Orbit of element y in group x.
NB. Returns the list of indices in y's orbit.
orbit =: ~.@:( /:~"1 ) @: ([ i."(1 _) ] )


NB. Returns the orbit of element y in group x, boxed.
orbit_boxed =: <@:~.@:( /:~"1 ) @: ([ i."(1 _) ] )


NB. Returns the list of orbit sizes for each
NB. element of group y.
orbit_sizes =: ] ( # @: orbit"(_ 0) ) (0&{"2)


NB. Returns 1 if group y is transitive, 0 otherwise.
NB. TODO This is too slow. Should stop calculation
NB. if one element's orbit size is less than group order.
is_transitive =: 3 : 0
if. is_cyclic y do.
	1
else.
	( ( +/ @: orbit_sizes ) = ( *: @: # ) ) y
end.
)


0 : 0 
y is permutation group.
returns 1 if y is symmetric group.
returns 0 otherwise.
)
is_symmetric =: # = (! @: {. @: (#"1))

0 : 0 
y is permutation group.
returns 1 if y is alternating group.
returns 0 otherwise.
)
is_alternating =:((2&*)@:#) = (! @: {. @: (#"1))

0 :0 
Returns 1 if permutation set y is a group,
 and 0 otherwise. 
)
is_group =: is_closed *. has_inverse


0 :0
Returns 1 if permutations set is closed.
)
is_closed =: (~.@: ( /:~"2 ) @: ] ) -: (,/ @: ~. @: (/:~"2 ) @: (] (C."(_ 1) ) ] ) )


0 :0
Returns 1 if permutation set y contains the inverses of all its permutations,
otherwise returns 0.
)
has_inverse =:   (~.@: ( /:~"2 ) @: ] ) -: ( ~. @: (/:~"2 ) @: ( /:"1))


0 :0
Returns the boxed disjoint orbits of elements of 
group y.
)
orbitsplit =:  ~.@:(] orbit_boxed"(_ 0) (i.@:# @: ({."2)))

	
0 :0
Returns 1 if group y is a direct product,
otherwise returns 0.
)
is_directproduct =: verb define
	NB. Get the number of disjoint orbits and get rid of any orbits of length 1,
	NB. i.e. stable points. Then count the number. If at least two
	NB. disjoint orbits then we have a direct product.

	orbits =: orbitsplit y

	NB. remove orbits of length 1 (i.e. stable points)
	orbits =: ((I.@:(1&<)@:>@:(#&.>)) { ]) orbits
	if. (# orbits) > 1 do.
		1
	elseif. 1 do.
		0
	end.
)


0 :0 
Returns the direct product subgroups of group y.
e.g. if group is C2xC3 then will return
Boxed C2, C3.
)
select_dp_subgroups =: verb define
	boxed =: orbitsplit y
	extract_subgroups =: ( ~.@:({"1) )&.>
	subgroups =: boxed extract_subgroups (< y)
	subgroups
)


0 :0 
Decomposes a direct product group into its constituent
groups. Returns the names of the groups if known, otherwise
returns the group's order.
e.g. if G = S3xA4 then decompose_directproduct G
should return: 'Sym 3, Alt 4', as boxed strings.
)
decompose_directproduct =: verb define
	result =: ''
	subs =: select_dp_subgroups y
	for_sb.  subs do.
		grp =: > sb
		or =: # grp
		o =: #@:{. grp
		if. or = 1 do.
			result =: result, <'Identity'
		elseif. is_symmetric grp do.
			result =: result, <( 'Sym ',":o)
		elseif. is_alternating grp do.
			result =: result, <( 'Alt ',":o)
		elseif. is_cyclic grp do.
			result =: result, <( 'Cyc ',":or)
		elseif. 1 do.
			result =: result, <( '??? ',":or)
		end.
	end.
	result
)


0 :0
Returns the intersection of permutation sets x and y.
If x and y are groups then x inter y will also be
a group.
)
inter =: (I.@:e."(2 2){ [)


0 :0
Returns the union of permutation sets x and y.
)
union =. ~."2@:(,"2)
NB. -----------------------------------------
NB. Example usage
NB. -----------------------------------------


NB. Example
NB. s4 =. Sym 4
NB. a4 =. Alt 4
NB. show all conjugacy classes:
NB. conjugacy_classes a4 
NB. -----------------------------------------
NB. Need the directproduct script
NB. load "directproduct.ijs"
NB. s4 =. Sym 4
NB. c7 =. Cyc 7
NB. s4xc7 =. s4 dir_prod c7 
NB. i.e. the direct product of S4 by C7.
NB. -----------------------------------------
NB. d8 =. Dih 8
NB. Get conjugacy classes of dihedral group.
NB. conjugacy_classes d8
NB. -----------------------------------------

