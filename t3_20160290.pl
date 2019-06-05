% Punto 1
notaaletra(X,Y):-X>=90,Y='A',integer(X).
notaaletra(X,Y):-X>=80,X<90,Y='B',integer(X).
notaaletra(X,Y):-X>=70,X<80,Y='C',integer(X).
notaaletra(X,Y):-X>=60,X<70,Y='D',integer(X).
notaaletra(X,Y):-X<60,X>=0,Y='F',integer(X).
notaaletra(X,Y):-X<0,Y='No es un numero positivo',integer(X).
% Punto 2
sucesor(X,Y):-Y is X + 1.
% Punto 3

% Punto 4

% Punto 5





















