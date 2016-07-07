mina(2,1).
mina(2,3).
mina(4,5).

valor(1,1,1). 
valor(1,2,2). 
valor(1,3,1). 
valor(1,4,1). 
valor(1,5,0). 

valor(2,2,2). 
valor(2,4,1). 
valor(2,5,0). 

valor(3,1,1). 
valor(3,2,2). 
valor(3,3,1). 
valor(3,4,2). 
valor(3,5,1). 

valor(4,1,0). 
valor(4,2,0). 
valor(4,3,0). 
valor(4,4,1). 

increment(Z, P) :- P is Z+1.
decrement(Z, P) :- P is Z-1.

writeStatus(X,Y,Z) :- write('valor('), write(X), write(','), write(Y), write(','), write(Z), write(')'), nl.

verifyAdjs(X,Y) :- adj1(X,Y), adj2(X,Y), adj3(X,Y), adj4(X,Y),adj5(X,Y),adj6(X,Y), adj7(X,Y),adj8(X,Y).

posicao(X,Y) :- mina(X,Y), write('Jogo Encerrado').
posicao(X,Y) :- valor(X,Y,0), writeStatus(X,Y,0), verifyAdjs(X,Y).
posicao(X,Y) :- valor(X,Y,Z), writeStatus(X,Y,Z).
posicao(_,_).

adj1(X,Y) :- decrement(X, X1), decrement(Y,Y1), \+ mina(X1,Y1), posicao(X1,Y1).
adj1(_,_).
adj2(X,Y) :- decrement(X, X1), \+ mina(X1,Y), posicao(X1,Y).
adj2(_,_).
adj3(X,Y) :- decrement(X, X1), increment(Y, Y1), \+ mina(X1,Y1), posicao(X1,Y1).
adj3(_,_).
adj4(X,Y) :- increment(Y, Y1), \+ mina(X,Y1), posicao(X,Y1).
adj4(_,_).
adj5(X,Y) :- increment(X, X1), increment(Y, Y1), \+ mina(X1,Y1), posicao(X1,Y1).
adj5(_,_).
adj6(X,Y) :- increment(X, X1), \+ mina(X1,Y), posicao(X1,Y).
adj6(_,_).
adj7(X,Y) :- increment(X, X1), decrement(Y, Y1), \+ mina(X1,Y1), posicao(X1,Y1).
adj7(_,_).
adj8(X,Y) :- decrement(Y, Y1), \+ mina(X,Y1), posicao(X,Y1).
adj8(_,_).
