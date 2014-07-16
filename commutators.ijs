NB. Functions for finding commutators and
NB. commutator subgroups.
NB. @author Jon Hough
NB. @since 16 July 2014

NB. TODO path to permutationgroups.ijs

NB. Returns the commutator of element x
NB. and element y. [x, y], defined as the product
NB. y^_(_1) * x^(_1) * x * y.
commutator =: ( inverse @: ] ) C."(1 1) conjugate


NB. Returns the commutator (derived) subgroup of group y.
derived_subgroup =: ~. @: ,/ @: (<"1 @: commutator"(_ 1)/~ i.~ <"1@:]) { ]


NB. Returns true if group y is perfect.
NB. i.e. y is equal to its commutator subgroup.
is_perfect =: # = ( # @: derived_subgroup )  
