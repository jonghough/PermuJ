0 : 0
Script for minimal spanning tree algorithms for graphs.
@author Jon Hough
)

0 : 0
Prim's Algorithm
Returns minimal spanning tree of connected graph y
)
prim_alg =: verb define
list =. 0		NB. list of already counted nodes (start at zero)
pairs =: '' 		NB. the pair, i.e. edges, of the spanning tree.
mat =. y 		NB. distance matrix, infinity imlies not adjacent.
size =. 0{ $ y	NB. Matrix must be square, so just get size of one axis.
swap =. (0&*)`(1&*)@.(1&=)  NB. to use J verbs (I.), swap _ with 0's.
while. (size > (# list)) do.
	remove =. ,@:|:@:(_&(list}))@:(list&{"1) NB. remove rows already in the list and flatten matrix.
	NB. get the next node (still need to get its(i,j) coords)
	next =. (I.@:(swap"0)@:(=<./))@:remove mat
	next =. 0{ next
	NB. get the new node (row index in matrix)
	temp =. size | next
	prevnode =. ((next - temp) % size ){ list NB. find which node reached the new node.
	newnode =. temp
	pairs =: pairs, (< ( prevnode, newnode))
	NB. add new node to list (so don't try to reach it in next iteration).
	list =. list, newnode
end.

pairs
)



NB. Some test graphs.

mat0 =: 4 4 $ _ _ _ 2, _ _ _ 5, _ _ _ 1. 2 5 1 _
mat1 =: 5 5 $ _ 2 5 _ 10, 2 _ 11 _ 7, 5 11 _ 6 _, _ _ 6 _ 9, 10 7 _ 9 _
mat2 =: 6 6$ _ 184	222 177 216 231, 184 _ 45 123 128 200, 222 45 _	129 121 203, 177 123 129 _ 46	83, 216 128 121 46	_ 83, 231	200 203 83 83 _
mat3 =: 7 7 $ _ _ _ _ 12 34 19, _ _ 30 _ 14 _ 22, _ 30 _ 18 10 _ _, _ _ 18 _ 40 27 11, 12 14 10 40 _ _ _, 34 _ _ 27 _ _ _, 19 22 _ 11 _ _ _
mat4 =: 8 8 $ _ _ _ _ 12 34 19 _, _ _ 30 _ 14 _ 22 _, _ 30 _ 18 10 _ _ _, _ _ 18 _ 40 27 11 _, 12 14 10 40 _ _ _ _, 34 _ _ 27 _ _ _ _, 19 22 _ 11 _ _ _ 14, _ _ _ _ _ _ 14 _
  