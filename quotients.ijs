NB. Quotient groups
NB.
NB. @author Jon Hough

0 : 0
Calculates quotient group multiplication of cosets x and y.
x and y must be cosets of subgroup N of G. Multiplication
x * y is n1g * n2G where g is the first permutation fo x,
n1 and n2 are elements of N and G is the initial group.
Calculation is equivalent to group multiplication in
the quotient group, G/N.
)
qmult =:   (~.&.<"2@: ( /:~"2 )) @: ((0&{"2@:[) C."(_ 1) ])

0 : 0
Calculates the order of an element 
in the quotient group of some group G.
e.g. If G is Alt 4 then the group V4, represented by
the permutations
0 1 2 3
3 2 1 0
1 0 3 2
2 3 0 1

is normal in G. This verb finds the order of some element in
Alt4 / V4.
)
qorder =: verb define

size =. # 0{ y
id =.  i. size
perm =. y 
c =: 1
if. id -:"(_ 1)  y do.
	1
else. 
whilst. (+/(id -:"(_ 1)  perm)) = size do.
	perm =. qmult/~ perm
	c =: c + 1
end.
end.
c
)
