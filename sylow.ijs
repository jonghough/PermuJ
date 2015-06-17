0 :0
Script for calculating order of a group's Sylow subgroups
 using Sylow's theorems.
 @author Jon Hough
 @since 22/09/2014
)

NB. Calculates the orders of all Sylow-p subgroups
NB. of group y, for all primes p, where p divides
NB. the order of y.
sylow1=: monad define
NB. decompose order of y into prime factors with powers.
decomp=: 2&p:@:#
NB. Get the orders of the Sylow subgroups
orders=: ~.@:,/@:((0&{"2) ^"(0 1) (>:"0@:i."0@:(1&{"2)))
syl=: orders decomp y
syl
)

NB. Calculate the *possible* number of sylow-p subgroups of group y,
NB. using Sylow's Theorem 3. For each prime p that divides |y|,
NB. this returns a list of the possible number of Sylow-p subgroups
NB. of y.
sylow3=: monad define
ord=: # y
div=: (<.=>.)@:%
decompN=: 2&p:@:#
NB. List of primes dividing |y|
primeList=: ~. (3&p:) # y
NB. Orders of the primes dividing |y|
ordersN=: ~.@:,/@:((0&{"2) ^"(0 0) (1&{"2))
NB. The value of each prime p to the max power dividing |y|.
maxPowers=: ordersN decompN y
NB. Initial possible values for the number of Sylow-p subgroups.
poss=: (i.@:#) y
NB. Coprime list: List of |y|/p^n for each prime p.
coprimeList=: %&(maxPowers) # y
NB. Test Sylow's theorem 3 (modulo tests).
test=: ((((1&="(1 0))@:(primeList&|"(1 0)))*.((1&="(1 0))@:(coprimeList&div"(1 0)))) * ])
NB. Calculate result
res=: ~.@:(test"0) poss
res =:  ((I.@:-.@:(0&e."0 1)) { ]) res
NB. box with original prime powers.
res=: (2 1) $ ((< maxPowers), <"2 res )
res
)