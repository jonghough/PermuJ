NB.J copy of some Sympy permutation functions.

NB. See https://github.com/sympy/sympy/blob/master/sympy/combinatorics/permutations.py#L24

mul =: C./ @: (>"0)

muln =: C./ @: (>"0)

parity =: (C.!.2)

inverse =: /:

power =: NB.TODO power p^n


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
add =: (-&1)@:A. A. (i. @: #)


