NB. Calculate Direct Products
NB.
NB.@author Jon Hough
NB.@since 10 July 2014


NB. Create the direct product of groups x and y.
direct_prod =: ([: <[) , ([: < ]) 


NB. Order of direct product group
order_dp =: */ @: (#"2) @: >


NB. Write list of all elements of cross product
NB. TODO


NB. Raw cross product of permutation sets x and y
cp =. ,/ @ ,"_1 _"_ _1


NB. Create direct product permutation list
NB. By concatenting group x with group y,
NB. where group y's permutations are translated
NB. to not intersect with x.
dir_prod =: [ cp ( [: ( 1&{ ) @: $ [ ) + ]

