PermuJ
======

Collection of J scripts for doing calculations with permutation groups.
Includes, or will hopefully include:

Creating permutation presentations of symmetric, alternating, dihedral, cyclic
groups.

Functionality includes:
* finding conjugacy classes and cosets
* enumerating conjugacy classes
* finding subgroups
* commutators and derived subgroups
* involutions and centers
* quotients
* automorphisms
* constructing modulo-multiplication groups for given positive integer
* direct products

Finding normal subgroups and group structure, and finding quotient groups, and automorphisms.

Why J?

The J programming language is ideal for doing any kind of mathematics, and is ideal
for looking into permutations and groups.

Usage
======

Need to have J installed. Best to install J 8.X ( http://www.jsoftware.com/stable.htm )


Example
======


NB. Create the symmetric group on 4 letters:

`s4 =: Sym 4`

NB. Create the dihedral group of order 8

`d4 =. Dih 4`

NB. Create direct product of S4 and D4:

`s4d4 =: s4 dir_prod d4`

NB. get the center of s4d4

`cent =. center s4d4`

Incidentally, the size of the center is 192 (i.e. 192 permutations make up the center of S4xD4). This can be seen by
`#cent`

192

NB. Get the derived subgroup of s4d4

`derived_subgroup s4d4`

which gives

```
0 1 2 3 4 5 6 7

0 3 1 2 4 5 6 7

0 2 3 1 4 5 6 7

3 1 0 2 4 5 6 7

2 1 3 0 4 5 6 7

1 0 3 2 4 5 6 7

2 0 1 3 4 5 6 7

3 2 1 0 4 5 6 7

1 2 0 3 4 5 6 7

1 3 2 0 4 5 6 7

2 3 0 1 4 5 6 7

3 0 2 1 4 5 6 7

0 1 2 3 6 7 4 5

0 3 1 2 6 7 4 5

0 2 3 1 6 7 4 5

3 1 0 2 6 7 4 5

2 1 3 0 6 7 4 5

1 0 3 2 6 7 4 5

2 0 1 3 6 7 4 5

3 2 1 0 6 7 4 5

1 2 0 3 6 7 4 5

1 3 2 0 6 7 4 5

2 3 0 1 6 7 4 5

3 0 2 1 6 7 4 5
```

We might want to inspect the contents of the derived group:

```dg =: derived_subgroup s4d4```

```conjugacy_classes dg```


```
┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
│0 1 2 3 4 5 6 7│0 3 1 2 4 5 6 7│0 2 3 1 4 5 6 7│1 0 3 2 4 5 6 7│0 1 2 3 6 7 4 5│0 3 1 2 6 7 4 5│0 2 3 1 6 7 4 5│1 0 3 2 6 7 4 5│
│               │1 2 0 3 4 5 6 7│1 3 2 0 4 5 6 7│2 3 0 1 4 5 6 7│               │1 2 0 3 6 7 4 5│1 3 2 0 6 7 4 5│2 3 0 1 6 7 4 5│
│               │2 1 3 0 4 5 6 7│2 0 1 3 4 5 6 7│3 2 1 0 4 5 6 7│               │2 1 3 0 6 7 4 5│2 0 1 3 6 7 4 5│3 2 1 0 6 7 4 5│
│               │3 0 2 1 4 5 6 7│3 1 0 2 4 5 6 7│               │               │3 0 2 1 6 7 4 5│3 1 0 2 6 7 4 5│               │
└───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘
```


The above gives a list of the conjugacy classes of dg.


We can also attempt to decompose dg into direct products.

```decompose_directproduct dg```

```
┌─────┬─────┬─────┐

│Alt 4│Sym 2│Sym 2│

└─────┴─────┴─────┘
```
   
   Example: Calculate module multiplication group for the number 45:
   
   `mmg_groupnames 45`
   
   Example: Calculate possible sylow subgroups of S(5) (symmetirc group on 5 elements):

   `sylow3 Sym 5`


  

