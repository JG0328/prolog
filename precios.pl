precio(lapicero,80).
precio(papel,220).
precio(computadora,12000).
precio(carro,300000).
precio(tomates,15).

% Devuelve en el segundo argumento articulos que tienen precio por
% debajo de un tope especificado como primer argumento.
articulopordebajo(Tope,Articulo):-precio(Articulo,Precio),Precio<Tope.

% Aplicar descuento.
preciocondescuento(Descuento,Art,PrecioN):-precio(Art,Precio),Precio>=10000,Precio=<15000,PrecioN is Precio-(Precio*(Descuento/100)).
preciocondescuento(_,Art,Precio):-precio(Art,Precio),Precio<10000.
preciocondescuento(_,Art,Precio):-precio(Art,Precio),Precio>15000.
