0 :0
Script defines modulo multiplication groups.
@author Jon Hough
@since 13 Nov 2014
)

0 :0
Totient function
)
totient =: 5&p:

0 :0
Modulo multiplication group for odd prime power.
)
mmg_oddp =:  Cyc @: totient

0 :0
Modulo multiplication group for powers of 2.
)
mmg_2pow =: verb define
grp =: 0
if. y = 2 do.
	grp =: 0
elseif. y = 4 do.
	grp =: Cyc 2
elseif. 1 do.
	grp =: (Cyc 2) dir_prod (Cyc y - 2)
end.
grp
)