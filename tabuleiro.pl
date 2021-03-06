:-[mina].


increment(Z, P) :- P is Z+1.
decrement(Z, P) :- P is Z-1.

clean_enviroment :- open('ambiente.pl',write, Stream), close(Stream).

buildBoard(X, N, List)  :- findall(X, between(1, N, _), List).

iterateBoard(L) :- LIN is 1, COL is 1, iterateBoard(L, LIN, COL).
iterateBoard([], _, _).
iterateBoard(L, LIN, 6) :- increment(LIN, NEXTLIN), COL is 1, open('ambiente.pl',append, Stream), nl(Stream), close(Stream), iterateBoard(L, NEXTLIN, COL).
iterateBoard([X|T], LIN, COL) :- checkAdjs(LIN, COL, X, NEWX), writeBoardOnFile(LIN, COL, NEWX), increment(COL,NEXTCOL), iterateBoard(T, LIN, NEXTCOL).

writeBoardOnFile(LIN,COL,X) :- \+ X is -1, open('ambiente.pl',append, Stream), nl(Stream), write(Stream, 'valor('), write(Stream, LIN), write(Stream, ','),
	                 write(Stream, COL), write(Stream, ','),write(Stream, X), write(Stream, '). '), close(Stream).
writeBoardOnFile(_,_,_).

checkAdjs(LIN, COL, X, NEWX) :- \+ mina(LIN, COL),adj1(LIN,COL, X, X1), adj2(LIN,COL, X1, X2), adj3(LIN,COL, X2, X3),
				adj4(LIN,COL, X3, X4),adj5(LIN,COL, X4, X5),adj6(LIN,COL, X5, X6), adj7(LIN,COL, X6, X7),
				adj8(LIN,COL, X7, NEWX).
checkAdjs(_,_,_,NEWX) :- NEWX is -1.

adj1(LIN,COL, X, NEWX) :- decrement(LIN, NEWLIN), decrement(COL,NEWCOL), mina(NEWLIN,NEWCOL), increment(X, NEWX).
adj1(_,_, X, NEWX):- NEWX is X.
adj2(LIN,COL, X, NEWX) :- decrement(LIN, NEWLIN), mina(NEWLIN,COL), increment(X, NEWX).
adj2(_, _, X, NEWX):- NEWX is X.
adj3(LIN,COL, X, NEWX) :- decrement(LIN, NEWLIN), increment(COL, NEWCOL), mina(NEWLIN,NEWCOL), increment(X, NEWX).
adj3(_, _, X, NEWX):- NEWX is X.
adj4(LIN,COL, X, NEWX) :- increment(COL, NEWCOL), mina(LIN,NEWCOL), increment(X, NEWX).
adj4(_, _, X, NEWX):- NEWX is X.
adj5(LIN,COL, X, NEWX) :- increment(LIN, NEWLIN), increment(COL, NEWCOL), mina(NEWLIN,NEWCOL), increment(X, NEWX).
adj5(_, _, X, NEWX):- NEWX is X.
adj6(LIN,COL, X, NEWX) :- increment(LIN, NEWLIN), mina(NEWLIN,COL), increment(X, NEWX).
adj6(_, _, X, NEWX):- NEWX is X.
adj7(LIN,COL, X, NEWX) :- increment(LIN, NEWLIN), decrement(COL, NEWCOL), mina(NEWLIN,NEWCOL), increment(X, NEWX).
adj7(_, _, X, NEWX):- NEWX is X.
adj8(LIN,COL, X, NEWX) :- decrement(COL, NEWCOL), mina(LIN,NEWCOL), increment(X, NEWX).
adj8(_, _, X, NEWX):- NEWX is X.

inicio :- clean_enviroment, buildBoard(0, 20, L), iterateBoard(L).
