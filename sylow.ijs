NB. Script for calculating order of a group's Sylow subgroups
NB. using Sylow's theorems.
NB. @author Jon Hough
NB. @since 22/09/2014


NB. Calculates the orders of all Sylow-p subgroups
NB. of group y, for all primes p, where p divides
NB. the order of y.
sylow_one =: verb define
	NB. decompose order of y into prime factors with powers.
	decomp =: 2&p:@:# 
	NB. Get the orders of the Sylow subgroups
	orders =: ~.@:,/@:((0&{"2) ^"(0 1) (>:"0@:i."0@:(1&{"2))) 
	syl =: orders decomp y
	syl
)

NB. Calculate the number of sylow-p subgroups of group y,
NB. using Sylow's Theorem 3.
sylow_three =: verb define
	
	decompN =: 2&p:@:#
	ordersN =: ~.@:,/@:((0&{"2) ^"(0 0) (1&{"2)) 
	NB. Number of sylow p-subgroups of group y
	NB. divides |y|/p^N
	coprime =: %~
	NB.TODO
	NB.poss =: 		 (>:@:i.@:#)
)