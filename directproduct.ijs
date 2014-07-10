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