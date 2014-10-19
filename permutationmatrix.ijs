0 :0
Script for calculating permutation matrices
@author Jon Hough
@since 15 October 2014
)

0 :0 
Id matrix of size y
)
identity =: =@i.

0 :0 
Generates permutation matrix of permutation y.
)
pm =: C. (identity @: #)


0 :0
Generates the full permutation matrix list of group y.
)
to_permutation_matrix =: pm"1
