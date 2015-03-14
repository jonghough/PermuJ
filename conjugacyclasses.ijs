NB. Script for handling conjugacy classes,
NB. e.g. partition group into conjugacy classes.
NB. get sizes of conjugacy classes.
NB. @since 14 March 2015

NB. square a group by cartesian product.
square =: dir_prod/~
NB. Returns the sizes of each conjugacy class of the group.
cc_sizes =: #&.>@:conjugacy_classes