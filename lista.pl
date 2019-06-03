come(juan,[papas,pollo]).
come(maria,[arroz,habichuelas,pollo]).
come(ana,[jugo]).

lista([]).
lista((X|L)):-lista(L).

miembro(X,[X|_]).
miembro(X,[_|Y]):-miembro(X,Y).

ultimo([X|[]],X).
ultimo([_|Y],X):-ultimo(Y,X).
