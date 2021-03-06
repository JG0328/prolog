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

% Match. Busca las personas que se gustan mutuamente.
% Recibe 2 argumentos. X o Y pueden ser tanto hombre como mujer. El
% corte y fallo se utiliza para evitar que se sigan buscando parejas una
% vez se encuentren todas en la primera regla (hombre en primer lugar).
% La tercera regla es para el caso de que la mujer est� en primer lugar.
% Utilizo una regla auxiliar, para simplificar.
gustamutuo(X,Y):-gusta(X,Y),gusta(Y,X).
match(X,Y):-hombre(X),mujer(Y),gustamutuo(X,Y).
match(X,_):-hombre(X),!,fail.
match(X,Y):-mujer(X),hombre(Y),gustamutuo(X,Y).
