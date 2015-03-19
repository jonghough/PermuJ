NB. Quotient groups
NB.
NB. @author Jon Hough

NB.Calculates quotient group multiplication of cosets x and y.
NB.x and y must be cosets of normal subgroup N of G. Multiplication
NB.x * y is n1g * n2G where g is the first permutation fo x,
NB.n1 and n2 are elements of N and G is the initial group.
NB.Calculation is equivalent to group multiplication in
NB.the quotient group, G/N.
qmult=: ( ( /:~"2 )) @: ((0&{"2@:[) C."(_ 1) ])


NB.Calculates the order of an element
NB.in the quotient group of some group G.
NB.e.g. If G is Alt 4 then the group V4, represented by
NB.the permutations
NB.0 1 2 3
NB.3 2 1 0
NB.1 0 3 2
NB.2 3 0 1

NB.is normal in G. This verb finds the order of some element in
NB.Alt4 / V4.
qorder=: verb define

size=. # 0{ y
id=. < i. size
perm=. y
c=. 1
exists=. (0&=)@:([ e. ([: <"1 ]))
isId=. id&=@:(<@:(0&{"2))
if. id e. (<"1 perm) do.
  c=. 1
else.
  while. -. isId perm do.
    
    perm=. y qmult perm
    c=. c + 1
    
  end.
end.
c
)

NB.Calculates all the orders of the elements of the quotient group y.
all_qorders=: qorder"2


NB.Calculates the inverse of coset y in quotient group x.
qinverse=: dyad define
grp=: ''
size=. # 0{ y
id=: < i. size
index=: 0
for_j. i. # x do.
  if. id e. (<"1 (y qmult (j{"3 x))) do.
    grp=: j{"3 x
    index=: j
    break.
  end.
end.
grp ; index

)

NB.Calculates all the inverses
all_qinverses=: qinverse"(_ 2)/~


qconjugate=: ([: inverse ]) qmult qmult
NB. notes example group quotient
NB. s3xa4 / [s3xa4] = c6