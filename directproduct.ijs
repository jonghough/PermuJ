NB. Calculate Direct Products. Relatively easy verbs,
NB. involving cross-producting all the elements of two
NB. groups and flattening the result.
NB.@author Jon Hough
NB.@since 10 July 2014


NB. Raw cross product of permutation sets x and y
cp =. ,/ @ ,"_1 _"_ _1


NB. Create direct product permutation list
NB. By concatenting group x with group y,
NB. where group y's permutations are translated
NB. to not intersect with x.
dir_prod =: ,/ @: ( [ cp ( [: ( 1&{ ) @: $ [ ) + ] )

