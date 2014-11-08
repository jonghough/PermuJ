0 : 0
Cayley table constructions.
@author Jon Hough
@since October 26 2014
)

0 : 0
Multiplication index.
The index in the permutation list of element y
multiplied by elements of the group x.
)
multindex =: [ i. C.

0 : 0
Cayley table
The Cayley table of the group y. 
)
cayley_table =: multindex"(_ 1)/~ 