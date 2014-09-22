NB.


NB. Calculates the orders of all Sylow-p subgroups
NB. of group y, for all primes p, where p divides
NB. the order of y.
sylow_one =: verb define
	decomp =: 2&p:@:# 
	orders =: ~.@:,/@:((0&{"2) ^"(0 1) (>:"0@:i."0@:(1&{"2))) 
	syl =: orders decomp y
)