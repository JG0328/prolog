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
% Se devuelve el antepen�ltimo elemento de la lista. El caso m�s
% sencillo es cuando se tienen tres elementos, el antepen�ltimo ser� el
% primer elemento de esa lista. En caso de que la lista tenga m�s de
% tres elementos, se va descartando la cabeza y enviando la lsita
% restante hasta que queden solo tres elementos.
antepenultimo([X,_,_],X).
antepenultimo([_,Y|Z],X):-antepenultimo([Y|Z],X).
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
% Se devuelve una lista inversa a la lista original.
% Existen dos casos base: si la lista est� vac�a, su inversa es otra
% lista vac�a. Si la lista solo tiene un elemento, su inversa es la
% misma lista. X toma el valor de la cabeza de la lista que se env�a. Y
% contiene la cola. Z es la lista inversa de la original. Cuando se
% recorre la lista y solo queda un elemento, la regla se cumple y se
% hacen los append's necesarios. W se utiliza para ir construyendo la
% lista.
inversa([],[]).
inversa([X],[X]).
inversa([X|Y],Z):-inversa(Y,W),append(W,[X],Z).





















