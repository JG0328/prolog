% Punto 1
% Dada una calificaci�n entera, se devuelve su equivalente en letra,
% basado en el sistema de calificaciones.
% X -> El n�mero que se recibe
% para evaluar su letra equivalente. Y -> El valor de la letra, luego de
% evaluar.
notaaletra(X,Y):-X>=90,Y='A'.
notaaletra(X,Y):-X>=80,X<90,Y='B'.
notaaletra(X,Y):-X>=70,X<80,Y='C'.
notaaletra(X,Y):-X>=60,X<70,Y='D'.
notaaletra(X,Y):-X<60,X>=0,Y='F'.
notaaletra(X,Y):-X<0,Y='No es un numero positivo'.
% Punto 2
% Se determina el sucesor de un n�mero, que es el que se encuentra
% inmediatamente despu�s de �l.
% X -> El n�mero que se recibe.
% Y -> El valor del sucesor de X.
sucesor(X,Y):-Y is X + 1.
% Punto 3

% Punto 4
% Se devuelve una lista con los n�meros pares encontrados en la lista
% inicial. Utilizo par como regla auxiliar para simplificar la regla
% pares. Para una lista vac�a, pares devuelve otra lista vac�a (caso m�s
% sencillo). X es el n�mero que se est� evaluando, la cabeza de la
% lista. Y toma el valor de la cola. Z es la lista en la que se agregan
% los n�meros pares. La variable an�nima se utiliza para descartar un
% n�mero, en caso de que sea impar.
par(X):-X mod 2 =:= 0.
pares([],[]).
pares([X|Y],[X|Z]):-par(X),pares(Y,Z).
pares([_|Y],Z):-pares(Y,Z).
% Punto 5





















