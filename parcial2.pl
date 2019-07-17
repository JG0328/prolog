% Matricula: 20160290
% Punto 1
% a) Utilizo un predicado auxiliar que hice mas abajo para contar los
% elementos de una lista.
monedas([]).
monedas([x]).
monedas([x,x]).
monedas([x,x,x]).
monedas([x,x,x,x]).
monedas([]).

monedas_salida:-monedas(X),contar(X,Y),write(Y),write(" "),false.
% b)
iguales(0,0).
iguales(s(X),s(Y)).
% c)
min(N1,N2,N1):-N1=<N2,!.
min(N1,N2,N2).
% d) Se obtienen las 3 barquillas con sabores iguales.
bola(fresa).
bola(chocolate).
bola(vainilla).
barquilla(T,M,B):-bola(T),bola(M),bola(B),T=M,T=B.
cono:-barquilla(X,Y,Z),append([],[X,Y,Z],W),write(W),write(" "),false.
% e)
insertarp(X,[Y|[]],W):-append([],[X,Y],W).
insertarp(X,[Y|Z],W):-insertarp(X,Z,L),append([Y],L,W).

% Punto 2
%planetas del sistema solar, clasificacion del planeta, masa con
% respecto a la tierra,distancia ordinal al sol
planeta(mercurio,[telurico],0.06,1).
planeta(venus,[telurico],0.82,2).
planeta(tierra,[telurico],1,3).
planeta(marte,[telurico],0.11,4).
planeta(jupiter,[gigante,gaseoso],318,5).
planeta(saturno,[gigante,gaseoso],95,6).
planeta(urano,[gigante,helado],14.6,7).
planeta(neptuno,[gigante,helado],17.2,8).


%satelites de los planetas

satelites(mercurio,[]).
satelites(venus,[]).
satelites(tierra,[luna]).
satelites(marte,[]).
satelites(jupiter,[io,europa,ganimedes,calisto]).
satelites(saturno,[titan,tetis,dione,rea,japeto,mimas,encelado]).
satelites(urano,[miranda,ariel,umbriel,titania,oberon]).
satelites(neptuno,[triton]).

% periodos de rotacion de los planetas en dias

rotacion(mercurio,58.6).
rotacion(venus,43).
rotacion(tierra,1).
rotacion(marte,1.03).
rotacion(jupiter,0.414).
rotacion(saturno,0.426).
rotacion(urano,0.718).
rotacion(neptuno,0.6745).


% periodos orbitales de los planetas en años

traslacion(mercurio,0.24).
traslacion(venus,0.615).
traslacion(tierra,1).
traslacion(marte,1.88).
traslacion(jupiter,11.86).
traslacion(saturno,29.46).
traslacion(urano,84.01).
traslacion(neptuno,164.79).

% a) Utilizo contar para obtener la cantidad de satelites que tiene un
% planeta, contando la cantidad de elementos de la lista. cantsatelites
% obtiene la lista de satelites y los cuenta. tiempotraslacion verifica
% si esa cantidad es mayor que 1.
contar([],Y):-Y is 0.
contar([X|Z],Y):- contar(Z,W), Y is W + 1.

cantsatelites(X,Y):-satelites(X,Z),contar(Z,Y).
tiempotraslacion(X,Y):-traslacion(X,Y),cantsatelites(X,Z),Z>1.
% b)
%
% c)
teluricosatelite:-planeta(X,Y,_,_),satelites(X,Z),contar(Z,W),member(telurico,Y),W>0,write("Los planetas teluricos pueden tener satelites."),!.

% Punto 3
%continente, area (km2) y poblacion total aproximada (al año 2008)
continente(africa,30370000,922011000).
continente(europa,10180000,731000000).
continente(asia,43810000,3879000000).
continente(america,42330000,910000000).
continente(oceania,9008500,32000000).
continente(antartida,13720000,1000).

% Franjas que delimitan los territorios entre continentes vecinos

limite(africa,europa,estrecho_gibraltar).
limite(asia,africa,itsmo_suez).
limite(asia,america,estrecho_bering).
limite(oceania,asia,linea_wallace).
limite(asia,europa,depresion_kuma_manych).

% Composición de las franjas delimitadoras
mar(estrecho_gibraltar).
mar(estrecho_bering).
mar(depresion_kuma_manych).
mar(linea_wallace).
tierra(depresion_kuma_manych).
tierra(itsmo_suez).

%cantidad paises reconocidos por continente
paises_reconocidos(africa,55).
paises_reconocidos(europa,50).
paises_reconocidos(asia,49).
paises_reconocidos(america,35).
paises_reconocidos(oceania,14).
paises_reconocidos(antartida,0).

%cantidad de territorios dependientes por continente
dependencias(africa,2).
dependencias(europa,3).
dependencias(asia,6).
dependencias(america,25).
dependencias(oceania,16).
dependencias(antartida,0).

%cantidad de paises no reconocidos por continente
paises_no_reconocidos(africa,2).
paises_no_reconocidos(europa,7).
paises_no_reconocidos(asia,6).
paises_no_reconocidos(america,0).
paises_no_reconocidos(oceania,0).
paises_no_reconocidos(antartida,0).

% a) C es la cantidad especificada por el usuario. Se calcula la
% densidad poblacional y se comprueba que sea mayor a C.
supera_cant(C,X):-continente(X,W,D),Y is D/W,Y>C.
% b)
continentes_limites_maritimos(X):-limite(P,W,D),mar(D),append([],P,X).
% c) Se suman los paises reconocidos y no reconocidos, luego se calcula
% el porcentaje de dependencias. El caso de Antartida no se toma en
% cuenta.
calcular_dependencia(X,T):-paises_reconocidos(X,Y),paises_no_reconocidos(X,Z),X\=antartida,W is Y + Z,dependencias(X,D),T is (D/W)*100.0.
tasa_dependencia(X):-calcular_dependencia(X,T),T>70.0.
% d) Se buscan cuales continentes tienen por lo menos un 0.05% de paises
% no reconocidos en el total de sus paises.
no_reconocidos_porcentaje(X):-paises_reconocidos(X,Y),paises_no_reconocidos(X,Z),W is Y + Z,W>0,P is ((Z/W) * 100.0),P>(W*0.005).
