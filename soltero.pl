hombre(juan).
hombre(carlos).

mujer(maria).
mujer(laura).

padre(juan,maria).
padre(juan,carlos).

madre(laura,maria).
madre(laura,carlos).

esposo(juan,laura).
esposo(laura,juan).

% Soltero
soltero(X):-mujer(X),!,fail.
soltero(X):-hombre(X),esposo(X,_),!,fail.
soltero(_).

% No hijos
nohijos(X):-padre(X,_),!,fail.
nohijos(X):-madre(X,_),!,fail.
nohijos(_).

% Con not
solteronot(X):-not(mujer(X)),not(esposo(X,_)).

nohijosnot(X):-not(padre(X,_)),not(madre(X,_)).
