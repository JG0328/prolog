estado(3,3,0,0,izq).
final(estado(0,0,3,3,der)).

posible(cruzar(C,M),estado(Ci,Mi,_,_,izq)):-C=<Ci, M=<Mi.
posible(cruzar(C,M),estado(_,_,Cd,Md,der)):-C=<Cd, M=<Md.

resulta(E1,cruzar(C,M),E2):-posible(cruzar(C,M),E1),
	                    E1 = estado(Ci,Mi,Cd,Md,izq),
			    Cip is Ci-C,
			    Mip is Mi-M,
			    Cdp is Cd+C,
			    Mdp is Md+M,
			    E2 = estado(Cip,Mip,Cdp,Mdp,der).
resulta(E1,cruzar(C,M),E2):-posible(cruzar(C,M),E1),
	                    E1 = estado(Ci,Mi,Cd,Md,der),
			    Cip is Ci+C,
			    Mip is Mi+M,
			    Cdp is Cd-C,
			    Mdp is Md-M,
			    E2 = estado(Cip,Mip,Cdp,Mdp,izq).


accion(cruzar(C,M)):- (C=0 ; C=1 ; C=2),
	              (M=0 ; M=1 ; M=2),
		       C+M=<2, C+M>=1.

seguro(estado(Ci,Mi,Cd,Md,_)):- (Ci=<Mi; Mi=0),
	                        (Cd=<Md; Md=0).

sucesor(E1,E2) :- accion(A),
		  resulta(E1,A,E2),
		  seguro(E2).
