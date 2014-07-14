NB. Permutation representation of the Quaternion group.
NB. @author Jon Hough
NB. @since 14 July 2014



NB. Construction is 8x8 array of permutations
Q8 =: 8 8 $ 0 1 2 3 4 5 6 7 
	    1 0 3 2 5 4 7 6 
	    2 3 1 0 6 7 5 4 
	    3 2 0 1 7 6 4 5 
	    4 5 7 6 1 0 2 3
	    5 4 6 7 0 1 3 2
            6 7 4 5 3 2 1 0
            7 6 5 4 2 3 0 1
