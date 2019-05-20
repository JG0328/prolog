% Hechos principales
legusta(maria,pasta).
legusta(juan,carne).
legusta(juan,vino).
legusta(jose,pasta).
legusta(jose,carne).
legusta(jose,cerveza).

% A Juan le gusta todo lo que le gusta a Maria (1)
legusta(juan,X):-legusta(maria,X),X\=juan.

% A Juan le gusta todo aquel al que le guste la pasta(2)
legusta(juan,X):-legusta(X,pasta),X\=juan.

% A Juan le gusta todo aquel al que le gusten las bebidas alcoholicas
% (3) Hechos adicionales
bebidaalcohol(cerveza).
bebidaalcohol(vino).

legusta(juan,X):-legusta(X,Y),bebidaalcohol(Y),X\=juan.
