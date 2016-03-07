require 'viewmat'

NB. visualization of cayley table to see orbits of 
NB. each group element.
view_table =: viewmat@: cayley_table

NB. visualization of the orbit of an element of the
NB. group on a cayley table represntation of the group.
NB. left arg is index of element to visualize
NB. right arg is the group
view_orbit =: viewmat@: (= cayley_table@:])

NB. view the even permutations of the group (i.e. the even parity
NB. subgroup)
even_table =: viewmat@:(cayley_table e. I.@:(1&=)@:parity)