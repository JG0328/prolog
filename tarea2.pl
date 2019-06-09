% 1.
% ?. X is 3 + 4 * 5 - 1 + sqrt(9), Y is (3 + 4) * 5 % 2 // 3.
% Se le da prioridad a la raíz y la multiplicación, y por último se
% realizan las sumas y restas.
% X is 3 + 20 - 1 + 3 => 23 + 2 => 25
% Y toma el valor de 35, porque se ignora el %. Solo se calcula la parte
% de (3 + 4) * 5 => 7 * 5 = 35.

% 2. Hechos
ganados(juan,7).
ganados(susana,6).
ganados(pedro,2).
ganados(rosa,5).
jugados(rosa,10).
jugados(juan,13).
jugados(pedro,3).
jugados(susana,7).

% Reglas. X -> persona, Y -> porcentaje, Z -> toma el valor de lugar, en
% los casos de juegos jugados. W -> toma el valor de lugar en los casos
% de juegos ganados.
porcentaje_ganados(X,Y):-jugados(X,Z),ganados(X,W),Y is (W/Z)*100.

%3. X -> primer número, Y -> segundo número, Z -> mayor, menor o igual.
es(X,Y,Z):- X > Y, Z = 'El primero es mayor que el segundo.'.
es(X,Y,Z):- X < Y, Z = 'El primero es menor que el segundo.'.
es(X,Y,Z):- X == Y, Z = 'El primer y segundo numero son iguales.'.

%4. X -> Nombre, Y -> Plato.
escribo(X,Y):- open("platos.pl",append,ID),write("Escriba su nombre: "),read(X),nl,write("Escriba su plato favorito: "),read(Y),write(ID,"plato("),write(ID,X),write(ID,","),write(ID,Y),write(ID,")."),nl(ID),close(ID).

% 5. Con lo aprendido en clase, creo que aun no se puede leer un archivo
% completamente. Sin embargo, lo mas cercano es leer dos lineas, con
% skip.
