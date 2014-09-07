NB. Mathieu group M24 construction
NB. This is a collection of verbs to construct the
NB. S(5,8,24) Steiner System, containing 759 octads,
NB. and its automorphism group, M24.
NB. From this the stabilizer of one point and two points
NB. will give M23 and M22 respectiely. (i.e. automorphism
NB. groups of S(4,7,23) and S(3,6,22).
NB. Note: can also get S(2,5,21) and PSL(3,4)
NB.
NB. @authopr Jon Hough
NB. @since 28 July 2014

NB. 3 dimensional subspace of 8 dimensional
NB. subspace over F(2).
even_block0 =: 4 2 $ 0 0 0 0 0 0 0 0
even_block1 =: 4 2 $ 0 0 0 0 1 1 1 1
even_block2 =: 4 2 $ 0 0 1 1 0 0 1 1
even_block3 =: 4 2 $ 0 0 1 1 1 1 0 0
even_block4 =: 4 2 $ 0 1 0 1 0 1 0 1
even_block5 =: 4 2 $ 0 1 0 1 1 0 1 0
even_block6 =: 4 2 $ 0 1 1 0 0 1 1 0
even_block7 =: 4 2 $ 0 1 1 0 1 0 0 1


NB. 3 dimensional subspace of 8 dimensional
NB. subspace over F(2).
odd_block0 =: 4 2 $ 0 0 0 0 0 0 0 0
odd_block1 =: 4 2 $ 0 1 1 1 0 1 0 0
odd_block2 =: 4 2 $ 0 1 0 0 1 1 0 1
odd_block3 =: 4 2 $ 0 1 0 1 0 0 1 1
odd_block4 =: 4 2 $ 0 1 1 0 1 0 1 0
odd_block5 =: 4 2 $ 0 0 1 0 0 1 1 1
odd_block6 =: 4 2 $ 0 0 1 1 1 0 0 1
odd_block7 =: 4 2 $ 0 0 0 1 1 1 1 0


NB.Block addition (mod 2 addition for 2x4 blocks)
add =. (2&|)@: +


NB. negates the value y (i.e. 1 -> 0, 0 -> 1)
negate =.(2&| )@:(1&+)


NB.Calculate if modulo addition is evenly cut,
NB. for calculating Steiner System blocks for
NB. S(5,8,24) Steiner System.
even_cut =: (4&=)@:+/@:,@:add


NB. P is the collection of even blocks (points).
NB. L the collection of odd blocks (lines)
NB. each L defines a unique triple in P; those blocks who add to give
NB. 4. 
P =. even_block0; even_block1; even_block2; even_block3; even_block4; even_block5; even_block6; even_block7
L =. odd_block0; odd_block1; odd_block2; odd_block3; odd_block4; odd_block5; odd_block6; odd_block7


NB. TODO 
NB. 1. create verb to get the points on lines.
NB. 2. Create C-space, from three copies of P and L.
NB. 3. Find octads in C-space
NB. 4. Generate S(5,8,24) steiner system.