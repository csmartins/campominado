:- dynmic derrota/0, vitoria/0.

jogar(X,Y) :- [saida], assert(derrota).
jogar(X,Y) :- vitoria, write("Voce Ganhou!").
jogar(X,Y) :- decidirJogada, jogar(X,Y).

decidirJogada :- write("JOGADA").

randomX(X,X1):- random_between(1,X,X1).
randomY(Y,Y1):- random_between(1,Y,Y1).
