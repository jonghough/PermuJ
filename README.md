PermuJ
======

Collection of J scripts for doing calculations with permutation groups.
Includes, or will hopefully include:

Creating permutation presentations of symmetric, alternating, dihedral, cyclic
groups.

Finding cosets, conjugacy classes, subgroups, centers, commutators, derived subgroups, involutions etc.

Finding normal subgroups and group structure, and finding quotient groups, and automorphisms.

Why J?

The J programming language is ideal for doing any kind of mathematics, and is ideal
for looking into permutations and groups.

Usage
======

Need to have J installed. Best to install J 8.02 ( http://www.jsoftware.com/stable.htm )


Example
======


NB. Create the symmetric group on 4 letters:

s4 =: Sym 4

NB. Create the dihedral group of order 8

d4 =. Dih 4

NB. Create direct product of S4 and D4:

s4d4 =: s4 dir_prod d4

NB. get the center of s4d4

cent =. center s4d4

NB. Get the derived subgroup of s4d4

derived =. derived_subgroup s4d4




  

