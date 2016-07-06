#leitura do arquivo de minas
consult(mina.pl).
#escreve no arquivo 
arquivo("tabuleiro.pl").
write_tabuleiro(linha, coluna):- qtdBombasVizinhas((linha, coluna), n), arquivo(X), open(X, append, Stream),
write(Stream, "valor("),
write(Stream, linha),
write(Stream, ","),
write(Stream, coluna),
write(Stream, ","),
write(Stream, n),
write(Stream, ").\n"),
close(Stream).
