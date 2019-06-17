saldo_cuenta(maria,1000).
saldo_cuenta(flora,3000000).
saldo_cuenta(antonio,2000000).

% Predicados para saber quien es millonario
% Corte y fallo
millonario(X):-saldo_cuenta(X,Y),Y<1000000,!,fail.
millonario(X).
% Not
m(X):-saldo_cuenta(X,Y),\+(Y<1000000).
