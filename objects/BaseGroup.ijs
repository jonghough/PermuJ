NB. CLass to hold permutation group information.
NB. Essentially condenses a lot of functions and permutation sets
NB. into one single object.
NB. @author Jon Hough
NB. @since 5th September 204

require '~user/projects/Permuj'
coclass BaseGroup


create =: verb define
	order =: 0
	is_abelian =: 0
	is_transitive =: 0
	is_solvable =: 0
	center =: 0

