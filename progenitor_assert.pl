:-dynamic progenitor/2.
progenitor(juan,maria).

assertProgenitor:-write("Padre: "),read(X),write("Hijo: "),read(Y),assertz(progenitor(X,Y)),progenitor(X,Y),write(X),tab(1),write(Y).

retractPadre:-write("Padre: "),read(X),retract(progenitor(X,_)).

retractPadre(X,Y):-retract(progenitor(X,Y)).
