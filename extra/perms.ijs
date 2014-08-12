NB.J copy of some Sympy permutation functions.
NB. Some verbs taken directly from:
NB. http://www.jsoftware.com/help/phrases/permutations.htm
NB. See https://github.com/sympy/sympy/blob/master/sympy/combinatorics/permutations.py#L24

NB. multiplies list of boxed permutations.
mul =: C./ @: (>"0)

NB. Gives the parity of permutation, y
parity =: (C.!.2)

inverse =: /:


NB. Computes permutation x to the power y. 
NB. e.g.
NB.
NB. 1 0 4 3 2 power 3
NB.1 0 4 3 2
power =: {^: ( ]`( i. @ # @ [ ) )


NB. Returns 1 if permutation x commutes with permutation y,
NB. returns 0 otherwise.
commutes_with =: C.~ -: C.


NB. Returns the boxed cycle form of the permutation
NB. y.
cycle_form =: C.


NB. Multiplies the list of boxed cycle form permutations y
NB. e.g.
NB. ]a =. (<2), < 0 3 1
NB.┌─┬─────┐
NB.│2│0 3 1│
NB.└─┴─────┘
NB.
NB. ]b =. (<2), < 3 0 1
NB.┌─┬─────┐
NB.│2│3 0 1│
NB.└─┴─────┘
NB.
NB.cycle_mul (a,b)
NB.┌─┬─┬─┬─┐
NB.│0│1│2│3│
NB.└─┴─┴─┴─┘
NB. i.e. cycles (0 3 1)(3 0 1) = ()
cycle_mul =: C.^:2


NB. Returns permutation that is 
NB. lexicographically next in order, after permutation y.
NB. Permutation y is in standard form (not boxed cycle)
add =: (1&+)@:A. A. (i. @: #)


NB. Returns permutation that is 
NB. lexicographically previous in order, before permutation y.
NB. Permutation y is in standard form (not boxed cycle)
sub =: (-&1)@:A. A. (i. @: #)

NB. Returns 1 if permutation y is an involution, 0 otherwise.
NB. e.g. involution (0 2 1) is 1 because order(0 2 1) = 2
involution =: <@:(i.@:#) ="0 0 <@:(] C. ])

