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
decomp=. 2&p:@:#
NB. Get the orders of the Sylow subgroups
orders=. ~.@:,/@:((0&{"2) ^"(0 1) (>:"0@:i."0@:(1&{"2)))
/:~ orders decomp y
)

NB. Calculate the *possible* number of sylow-p subgroups of group y,
NB. using Sylow's Theorem 3. For each prime p that divides |y|,
NB. this returns a list of the possible number of Sylow-p subgroups
NB. of y.
sylow3=: monad define
ord=. # y
div=. (<.=>.)@:%
decompN=. 2&p:@:#
NB. List of primes dividing |y|
primeList=. <"0@:~. (3&p:) # y
NB. Orders of the primes dividing |y|
ordersN=. ~.@:,@:^/
NB. The value of each prime p to the max power dividing |y|.
maxPowers=: ordersN decompN y
NB. Initial possible values for the number of Sylow-p subgroups.
poss=. <@:(i.@:#) y
NB. Coprime list: List of |y|/p^n for each prime p.
coprimeList=. <"0@:%&(maxPowers) # y
NB. Test Sylow's theorem 3 (modulo tests).
t1 =. (-.&0) &.> primeList ((((1&=)@:|"(1 0)) * ])&.>) poss
t2 =. (-.&0) &.> coprimeList ((((<.=>.)@:%)"1 0*])&.>) poss
res =. t1 ((I.@:e. { [)&.>) t2
(<"0 maxPowers) ,&.> res
)
