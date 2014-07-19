NB. Functions for finding commutators and
NB. commutator subgroups.
NB. @author Jon Hough
NB. @since 16 July 2014

NB. TODO path to permutationgroups.ijs

NB. Returns the commutator of element x
NB. and element y. [x, y], defined as the product
NB. y^(_1) * x^(_1) * y * x.
commutator =: ( inverse @: ] ) C."(1 1) conjugate


NB. Returns the commutator (derived) subgroup of group y.
derived_subgroup =:  3 : 0
ord  =. # y       NB. order of group y
size =. 0{ #"1 y  NB. size of set acted on

NB. If Group y is symmetric then calculation is pointless.
NB. Return isomorphism of alternating subgroup of y.
NB. Warning: directly computing the commutator subgroup on 
NB. Sym(N) for N >= 7 can crash J, so this 'if block' is necessary.
if. (ord = ! size  ) do.
	alt =. Alt size
	alt
NB. Similar argument for symmetric groups also applies to
NB. alternating groups. For  N > 4, Alt(N) is simple.
NB. So commutator subgroup is itself.
elseif. ( ( ( 2 * ord ) = ! size ) *. (size > 4) ) do.
	grp =. y
	grp
elseif. (1) do.
	( ~. @: ,/ @: (<"1 @: commutator"(_ 1)/~ i.~ <"1@:]) { ] ) y
end.
)


NB. Returns true if group y is perfect.
NB. i.e. y is equal to its commutator subgroup.
is_perfect =: # = ( # @: derived_subgroup )  
