NB.J copy of some Sympy permutation functions.

NB. See https://github.com/sympy/sympy/blob/master/sympy/combinatorics/permutations.py#L24

mul =: C./ @: (>"0)

muln =: C./ @: (>"0)

parity =: (C.!.2)

inverse =: /:

power =: NB.TODO power p^n