% Punto 1
% En un principio, pensaba que la consulta devolvería true, sin embargo,
% prolog lanza un error, ya que el predicado p no está definido.
% Inicialmente, pensé que éste sería su comportamiento.
a:-b,!,p.
a:-r.
b:-q.
b:-e.
q.
r.

% Punto 2
% Estaba en lo correcto, la consulta retorna false. Luego de analizar
% con un trace, al momento de unificar con hamburguer_marchena(b), el
% corte y fallo impiden el backtracking y retorna false.
big_mac(a).
big_mac(c).
hamburger_marchena(b).
whopper(d).

hamburger(X) :- big_mac(X).
hamburger(X) :- hamburger_marchena(X).
hamburger(X) :- whopper(X).

legusta(juan,X) :- hamburger_marchena(X),!,fail.
legusta(juan,X) :- hamburger(X).

% Punto 3
% También, aquí retorna false. Realiza el mismo proceso que la anterior,
% pero con menos llamadas. Al momento de unificar hamburger_marchena(b),
% se lanza el fail.
legusta(juan,X) :- \+ hamburger_marchena(X), hamburger(X).


% Punto 4
