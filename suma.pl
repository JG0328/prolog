natural(0).
% natural(X):-natural(Y), X is Y + 1.
natural(s(X)):-natural(X).
% Suma
suma(0,X,X).
suma(s(X),Y,s(Z)):-suma(X,Y,Z).






















