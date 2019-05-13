progenitor(juan,pedro).
progenitor(juan,maria).
progenitor(irma,pedro).
progenitor(irma,maria).
progenitor(pedro,carlos).
progenitor(pedro,elena).
progenitor(maria,rosa).

% Sexo
hombre(juan).
hombre(pedro).
hombre(carlos).
mujer(maria).
mujer(elena).
mujer(rosa).
mujer(irma).

% Reglas
% Abuelo
abuelo(Abuelo,Nieto):-progenitor(Padre, Nieto),progenitor(Abuelo, Padre).

% Abuela
tieneabuela(X):-abuelo(Y,X),mujer(Y).

% Hijo
hijo(Hijo,Padre):-progenitor(Padre,Hijo).

% Hermano
hermano(X,Y):-progenitor(Z,X),progenitor(Z,Y).

% Tio
tio(Tio,Sobrino):-hijo(Sobrino,Padre),hermano(Tio,Padre).

% Primo
primo(X,Y):-tio(Z,X),hijo(Y,Z).

% Pareja
pareja(X,Y):-hijo(Z,X),hijo(Z,Y),X\=Y.

% Pareja Heterosexual)
parejahetero(Persona1, Persona2):-pareja(Persona1,Persona2),hombre(Persona1),mujer(Persona2).



















