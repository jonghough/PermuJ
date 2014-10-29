0 : 0
Test if graph y is connected.
Returns 1 if connected, 0 otherwise.
)
connected =: verb define
mat =: y		NB. the graph (square matrix)
in =: 0		NB. list of connected nodes, start at node 0.
size =: # y		NB. Size of y
all =: i. size 	NB. all nodes.
isconnected =: 0	NB. is connected flag.
counter =: 0	
NB. loop through all nodes in graph.
NB. Add any nodes connected to the in list to the in list.
NB. If connected, in will eventually contain every node.
while. (counter < size) do. 
	counter=: counter + 1 	NB. increment counter.
	toin =: ''
	NB. only want nodes that may not be connected. (remove "in" nodes)
	for_j. all -. in  do.
		NB. Get each column from in list and find non-infinite
		NB. edges from these nodes to nodes in all - in list.
		NB. (%) is to convert _ to 0.
		if. ((+/@:%@:(j &{"2) @: (in& { "1) mat ) > 0) do.
			toin =: toin ,  j
		end.
	end.
	NB. append toin to in. Number of connected nodes increases.
	in =: ~. in, toin
	NB. check connectivity.
	isconnected =:-. (# in ) < size
	if. isconnected do.
	end.
end.
isconnected
)