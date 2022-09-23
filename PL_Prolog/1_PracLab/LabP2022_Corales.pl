/*https://swish.swi-prolog.org*/

/*Parte 1: Aritmetica*/

/Ejercicio 1.1/

maximo(X,Y,X) :- X > Y.
maximo(X,Y,Y) :- X < Y.

/Ejercicio 1.2/

factorial(0,1).
factorial(N,R):- N1 is N-1, factorial(N1,R1), R is R1*N.

/Ejercicio 1.3/

suma_lista([],0).
suma_lista([X|XS],Y) :- suma_lista(XS,Y2), Y is Y2 + X. 

/*Parte 2: Operaciones con listas*/

/Ejercicio 2.1/

primero([],0).
primero([X|_], X).

/*
    ?- primero([X,b,c], a). 
        X = a
    ?- primero([X,Y], a).
        X = a
    ?- primero(X,a).
        X = [a|_1684]
*/

/Ejercicio 2.2/

cola([],0).
cola([_|XS], XS).

/Ejercicio 2.3/

cons(0,[],[]).
cons(X,L1,L2) :- L2 = [X|L1].
