NB. Automorphisms of permutation groups.
NB. @author Jon Hough
NB. @since 16 July 2014


NB. Returns the automorphism group of group y.
NB. Returns 0 if automorphism group is unkown.
auto =: 3 : 0
ord =. # y
NB. if y is prime order, then it is cyclic
NB. and it's automorphism group is isomorphic
NB. to the cyclic group of order |y|-1.
if. ( 1 p: ord ) do.
	cyc =. ( Cyc  ord - 1 ) 
	cyc
else.
	0
end.
)


NB. Euler totient function
totient=: (- ~:)&.q:

