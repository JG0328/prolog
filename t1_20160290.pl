% Hechos
% Sexo. Reciben 1 argumento.
hombre(felipe).
hombre(alfredo).
hombre(enrique).

mujer(susana).
mujer(josefina).
mujer(johanna).
mujer(martha).

% Color de pelo. Reciben 1 argumento.
pelorubio(felipe).
pelorubio(susana).
pelorubio(josefina).

pelonegro(alfredo).
pelonegro(enrique).

pelirrojo(johanna).
pelirrojo(martha).

% Posesiones. Reciben 1 argumento.
tieneoro(alfredo).
tieneoro(josefina).

tienecasa(martha).

tienecarro(felipe).

% Reglas
% Estatus. Se determina si la persona es rica o no. Recibe 1 argumento.
% Se basa en el hecho "tieneoro". X es la persona que se evalua.
esrico(X):-tieneoro(X).

% Gustos. Cada persona tiene sus reglas especificas para que alguien le
% guste. Se toma en cuenta que a los hombres solo les gustan las mujeres
% y viceversa. Cada regla "gusta" recibe 2 argumentos. La constante
% determina los hechos y las reglas a tomar en cuenta. X es la persona
% que se evalua para determinar si le gusta.

% Hombres
gusta(felipe,X):-mujer(X),esrico(X),pelorubio(X).
gusta(enrique,X):-mujer(X),esrico(X).
gusta(alfredo,X):-mujer(X),pelirrojo(X).

% Mujeres
gusta(susana,X):-hombre(X),pelonegro(X).
gusta(josefina,X):-hombre(X),pelonegro(X),esrico(X).
gusta(johanna,X):-hombre(X).
gusta(martha,X):-hombre(X).

% Match. Determina si dos personas se gustan mutuamente.
% Recibe 2 argumentos. Tanto X como Y pueden tomar hombres o mujeres.
match(X,Y):-gusta(X,Y),gusta(Y,X).
