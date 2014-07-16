NB. Script contains various Permutation Group Theory
NB. related verbs.
NB. @author Jon Hough
NB. @since 10 July 2014


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
conjugate =: ([: /:"1 [) C."(1 1) (C."(1 1)~)


NB. Gives the right cosets of element y in group x.
rcosets =: ~.@:(/:~"2) @:( ] C."(_ 1) [)


NB. Gives the left cosets of element y in group x.
lcosets =: ~.@:(/:~"2) @: ( C."1"1 _ )


NB. -----------------------------------------
NB. Verbs for conjugacy classes
NB. -----------------------------------------


NB. Creates conjugacy class of element y
NB. in group x.
conj_class =: ~. @: conjugate


NB. Gets the conjugacy class output by conjugating
NB. group y with itself. (Will contain multiple copies of
NB. the same conjugacy classes).
conjugate_list =. conj_class"(_ 1)/~


NB. Gets the array of conjugacy classes of the 
NB. given group. Nubs out duplicate arrays in
NB. conjugate_list to give the conjugacy classes.
conjugacy_classes =: ~. @: ( /:~"2 ) @: conjugate_list


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


NB. Returns the element y's order in group x.
element_order =: 4 : 0
grp =. x
elt =. y
cnt =. 1
max =. 2 + # x NB. Failsafe; break loop if concatenations exceed order of group.
id  =. < ( get_identity grp ) { grp
while. ( id -.@-:"(1 1) elt ) *. ( cnt < 500 ) do.
	elt =. y C. elt
	cnt =. cnt + 1
end.
cnt NB. return count, order of y in group x.
)


NB. Returns 1 if the group, y, is cyclic,
NB. 0 otherwise. Searches for element, g,
NB. such that o(g) = |y|.
is_cyclic. =: # e. element_order"(_ 1)/~


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

