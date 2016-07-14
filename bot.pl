vitoria(0).
derrota(0).

jogar(X,Y) :- [saida], derrota(1), write('Voce perdeu!').
jogar(X,Y) :- vitoria(1), write('Voce Ganhou!').
jogar(X,Y) :- decidirJogada, jogar(X,Y).

decidirJogada :- write('JOGADA').

randomX(X,X1):- random_between(1,X,X1).
randomY(Y,Y1):- random_between(1,Y,Y1).
