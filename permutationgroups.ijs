NB. Script contains various Permutation Group Theory
NB. related verbs.
NB. @author Jon Hough
NB. @since 10 July 2014


NB. -----------------------------------------
NB. Verbs for generating groups
NB. -----------------------------------------


NB. Generate Symmetric Group of order y
Sym =: (i. @: !) A. i.


NB. Generate Alternating group from
NB. corresponding Symmetric Group
Alt =: (I. @: (0.5&*) @: >: @: (C.!.2)) { ]


NB. Generate Cyclic Group of order y
Cyc =: i. |."(0 1) i.

NB. Generate Dihedral Group of order y.
NB. i.e. generated group has y permutations. 
NB. (Notation D_n, or D_2n)
Dih =: ( (|. @: (0&{) ) ( (C."(_ 1) ) , ]) ]) @: Cyc


NB. -----------------------------------------
NB. Verbs for elements of groups
NB. -----------------------------------------


NB. Get the order of permutation
order =: *./ @ (# & >"_) @ C.


NB. Get inverse of permutation
NB. TODO


NB. Conjugates y by x. i.e. calculates permutation
NB. equal to x^(_1)*y*x.
conjugate =: ([: /:"1 [) C."(1 1) (C."(1 1)~)


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
conjugacy_classes =: ~. @: (/:~"2) @: conjugate_list


NB. -----------------------------------------
NB. Example usage
NB. -----------------------------------------

NB. Example
NB. s4 =. Sym 4
NB. a4 =. Alt s4
NB. show all conjugacy classes:
NB. conjugacy_classes a4 
