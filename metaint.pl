p:-q,r.
q:-s.
s.
r.

solve(true).

solve((A,B)):-solve(A),solve(B).

solve(A):-clause(A,B),solve(B),!.
