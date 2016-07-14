:- dynamic valor/3.
:- [ambiente], [mina].

writeAmbiente(X,Y,Z) :- write('valor('), write(X), write(','), write(Y), write(','), write(Z), write(')'), nl.

writeJogada(X,Y) :-  open('saida.pl', append,Stream), write(Stream, '/*JOGADA '),  write(Stream, '*/'), nl(Stream),
                     write(Stream, 'posicao('), write(Stream, X), write(Stream, ','), write(Stream, Y),
                      write(Stream,').'), nl(Stream), write(Stream, '/*AMBIENTE*/'), nl(Stream), close(Stream).

writeAmbienteOnFile(X,Y,Z) :- open('saida.pl', append,Stream), write(Stream, 'valor('), write(Stream, X), write(Stream, ','),
                      write(Stream, Y), write(Stream, ','), write(Stream, Z), write(Stream, ').'),
                       nl(Stream), close(Stream).

writeNewLine :-  open('saida.pl', append,Stream), nl(Stream), close(Stream).

writeGameOver :-  open('saida.pl', append,Stream), write(Stream,"derrota."), nl(Stream),write(Stream, '/*Jogo Encerrado*/'), nl(Stream), close(Stream).
writeVictory :-  open('saida.pl', append,Stream), write(Stream,"vitoria."), nl(Stream), write(Stream, '/*Vitoria!*/'), nl(Stream), close(Stream).

verifyAdjs(X,Y) :- adj1(X,Y), adj2(X,Y), adj3(X,Y), adj4(X,Y),adj5(X,Y),adj6(X,Y), adj7(X,Y),adj8(X,Y).

posicao(X,Y) :- valor(X,Y,_), writeJogada(X,Y), checkPos(X,Y), checkVictory.
posicao(X,Y) :- mina(X,Y), writeJogada(X,Y), write('Jogo Encerrado'), writeGameOver, [ambiente].
posicao(_,_).

checkVictory :- \+ valor(_,_,_), write('Vitoria!'),nl , writeVictory.

checkPos(X,Y) :- valor(X,Y,0), writeAmbiente(X,Y,0), writeAmbienteOnFile(X,Y,0), retract(valor(X,Y,0)), verifyAdjs(X,Y).
checkPos(X,Y) :- valor(X,Y,Z), writeAmbiente(X,Y,Z), writeAmbienteOnFile(X,Y,Z), retract(valor(X,Y,Z)).
checkPos(_,_).

adj1(X,Y) :- decrement(X, X1), decrement(Y,Y1), \+ mina(X1,Y1), checkPos(X1,Y1).
adj1(_,_).
adj2(X,Y) :- decrement(X, X1), \+ mina(X1,Y), checkPos(X1,Y).
adj2(_,_).
adj3(X,Y) :- decrement(X, X1), increment(Y, Y1), \+ mina(X1,Y1), checkPos(X1,Y1).
adj3(_,_).
adj4(X,Y) :- increment(Y, Y1), \+ mina(X,Y1), checkPos(X,Y1).
adj4(_,_).
adj5(X,Y) :- increment(X, X1), increment(Y, Y1), \+ mina(X1,Y1), checkPos(X1,Y1).
adj5(_,_).
adj6(X,Y) :- increment(X, X1), \+ mina(X1,Y), checkPos(X1,Y).
adj6(_,_).
adj7(X,Y) :- increment(X, X1), decrement(Y, Y1), \+ mina(X1,Y1), checkPos(X1,Y1).
adj7(_,_).
adj8(X,Y) :- decrement(Y, Y1), \+ mina(X,Y1), checkPos(X,Y1).
adj8(_,_).
