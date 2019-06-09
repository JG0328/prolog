% Punto 1
% Dada una calificación entera, se devuelve su equivalente en letra,
% basado en el sistema de calificaciones.
% X -> El número que se recibe
% para evaluar su letra equivalente. Y -> El valor de la letra, luego de
% evaluar.
notaaletra(X,Y):-X>=90,Y='A'.
notaaletra(X,Y):-X>=80,X<90,Y='B'.
notaaletra(X,Y):-X>=70,X<80,Y='C'.
notaaletra(X,Y):-X>=60,X<70,Y='D'.
notaaletra(X,Y):-X<60,X>=0,Y='F'.
notaaletra(X,Y):-X<0,Y='No es un numero positivo'.
% Punto 2
% Se determina el sucesor de un número, que es el que se encuentra
% inmediatamente después de él.
% X -> El número que se recibe.
% Y -> El valor del sucesor de X.
sucesor(X,Y):-Y is X + 1.
% Punto 3

% Punto 4

% Punto 5





















