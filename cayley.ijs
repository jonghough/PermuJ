0 : 0
Cayley table constructions.
@author Jon Hough
@since October 26 2014
)

NB.Multiplication index.
NB.The index in the permutation list of element y
NB.multiplied by elements of the group x.
multindex=: [ i. C.

NB.Cayley table
NB.The Cayley table of the group y.
cayley_table=: multindex"(_ 1)/~