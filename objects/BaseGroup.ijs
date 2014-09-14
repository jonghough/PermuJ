NB. CLass to hold permutation group information.
NB. Essentially condenses a lot of functions and permutation sets
NB. into one single object.
NB. @author Jon Hough
NB. @since 5th September 2014


coclass BaseGroup


create =: verb define
	permutations =: ".@:( 1&{.)@:>y
	
	
)
destroy =: codestroy