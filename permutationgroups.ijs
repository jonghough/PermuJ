0 : 0 
Script contains various Permutation Group Theory
related verbs.
@author Jon Hough
@since 10 July 2014
)

NB. -----------------------------------------
NB. Verbs for generating groups
NB. -----------------------------------------

0 : 0 
Generate Symmetric Group of order y
)
Sym =: (i. @: !) A. i.


0 : 0 
Generate Alternating group of order y
)
Alt =: ( (I. @: (1&=) @: (C.!.2)) { ] ) @: Sym


0 : 0 
Generate Cyclic Group of order y
)
Cyc =: i. |."(0 1) i.

0 : 0  
Generate Dihedral Group of order y.
i.e. generated group has y permutations. 
(Notation D_n, or D_2n)
)
Dih =: ( (|. @: (0&{) ) ( (C."(_ 1) ) ,~ ]) ]) @: Cyc


NB. -----------------------------------------
NB. Verbs for elements of groups
NB. -----------------------------------------


0 : 0  
Get the order of permutation
)
order =: *./ @ (# & >"_) @ C.


0 : 0  
Get inverse of permutation
)
inverse =: /:

0 : 0  
Returns 1 if y is identity element,
returns 0 otherwise.
)
is_identity =: < = ( < @: C./~ )

0 : 0  
Gets the identity element's index in group y.
)
get_identity =: I. @:( is_identity"1 )

0 : 0  
Conjugates y by x. i.e. calculates permutation
equal to x^(_1)*y*x.
)
conjugate =: (([: /:"1 [) C."(1 1) (C."(1 1)~))

0 : 0  
Gives the right cosets of element y in group x.
)
rcosets =: ~.@:(/:~"2) @:( ] C."(_ 1) [)

0 : 0  
Gives the left cosets of element y in group x.
)
lcosets =: ~.@:(/:~"2) @: ( C."1"1 _ )

0 : 0  
Returns the set of right cosets of subgroup y
in group x. 
)
get_rcosets =: ~.@:( /:~"2 )@:( rcosets"(1 _) )

0 : 0  
Gets the right transversals of subgroup y in
group x.
)
r_transversals =. 0&{"2 @: get_rcosets


NB. -----------------------------------------
NB. Verbs for conjugacy classes
NB. -----------------------------------------

0 : 0  
Creates conjugacy class of element y
in group x.
)
conj_class =: <@:( /:~"2 )@:~. @: conjugate

0 : 0  
Gets the conjugacy class output by conjugating
group y with itself. (Will contain multiple copies of
the same conjugacy classes).
)
conjugate_list =: conj_class"(_ 1)/~

0 : 0  
Gets the array of conjugacy classes of the 
given group. Nubs out duplicate arrays in
conjugate_list to give the conjugacy classes.
)
conjugacy_classes =: ~.@: conjugate_list

0 : 0
Returns the conjugacy class sizes of group y, in boxed form.
)
ccs =: (#&.(>"0)) @: conjugacy_classes

0 : 0  
Stabilizer of point 0, in group y
)
stab0 =: ( I. @: (0&=) @: (0&{"1) ) { ]

0 : 0  
Stabilizer of point x in group y.
Will fail if x is larger than number of
objects y is permuting.
)
stabp =:  ( I. @: ( [ =  {"1) ) { ]

0 : 0  
Returns the center of group y. Calculates center by
conjugating all elements, i.e. |y|^2 conjugations,
and matches those that leave original element unchanged.
Slow ~ O(n^2).
)
center =: ( I. @: ( < ="(_ 2 ) ( <"2 @: ( ] conjugate"(1 _) ] ) ) ) ) { ]


0 : 0
Returns the boxed elements of group x which commute
with element y. i.e. returns the centralizer of y in x.
)
centralizer =: 4 : 0
grp =. x
elt =. y
boxedElt =: < elt
conj =: <"1 ( grp conjugate"(1 _) elt )
t =: (conj = boxedElt)# conj
t
)
0 : 0  
Returns 1 if the group, y, is cyclic,
0 otherwise. Searches for element, g,
such that o(g) = |y|.
)
is_cyclic =: # e. (order"1)

0 : 0  
Orbit of element y in group x.
Returns the list of indices in y's orbit.
)
orbit =: ~.@:( /:~"1 ) @: ([ i."(1 _) ] )

0 : 0  
Returns the orbit of element y in group x, boxed.
)
orbit_boxed =: <@:~.@:( /:~"1 ) @: ([ i."(1 _) ] )

0 : 0  
Returns the list of orbit sizes for each
element of group y.
)
orbit_sizes =: ] ( # @: orbit"(_ 0) ) (0&{"2)

0 : 0  
Returns 1 if group y is transitive, 0 otherwise.
TODO This is too slow. Should stop calculation
if one element's orbit size is less than group order.
)
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

