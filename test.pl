long([],0).
long([_|L],X):-long(L,RE),X is RE+1.
