NB. Presentations of groups
NB.
NB. @author Jon Hough
NB. @since 26 Dec 2014

NB.

NB. define adverb
NB. this adverb creates a J form of mathematical where (|) syntax.
NB. e.g. {x e. N | x < 4} 
NB. That is, get all x from n such that x < 4.
NB. x < 4 would be the verb modified by this adverb.
where=: 2 : '(#~ v) m'

NB. todo generate group permutations from a list of conditions in verb v, modified by where.

