% Punto 1
% En un principio, pensaba que la consulta devolver�a true, sin embargo,
% prolog lanza un error, ya que el predicado p no est� definido.
% Inicialmente, pens� que �ste ser�a su comportamiento.
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
% Tambi�n, aqu� retorna false. Realiza el mismo proceso que la anterior,
% pero con menos llamadas. Al momento de unificar hamburger_marchena(b),
% se lanza el fail.
legusta(juan,X) :- \+ hamburger_marchena(X), hamburger(X).

% Punto 4
% Utilic� numlist/3 de los predicados pre-definidos en Prolog. Adem�s
% utilic� los predicados y reglas auxiliares de la tarea anterior para
% trabajar con los n�meros pares. X y Y son los l�mites de la lista que
% se va a crear. Z es la lista final creada por numlist/3. Se crea otra
% lista W con solo los n�meros pares, con pares. Por �ltimo, se agrega
% el predicado listado/1 con la lista, usando assertz, para insertar al
% final. El corte evita que luego de lanzar true se quede esperando.
% listado(X) devuelve todas las listas que se han creado.
:-dynamic listado/1.

par(X):-X mod 2 =:= 0.
pares([],[]).
pares([X|Y],[X|Z]):-par(X),pares(Y,Z).
pares([_|Y],Z):-pares(Y,Z).

aserta_pares(X,Y):-numlist(X,Y,Z),pares(Z,W),assertz(listado(W)),!.
