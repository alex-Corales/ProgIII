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

/Ejercicio 2.1 (cabeza)/

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

/Ejercicio 2.2 (cola)/

cola([],0).
cola([_|XS], XS).

/Ejercicio 2.3 (constructor)/

cons(0,[],[]).
cons(X,L1,L2) :- L2 = [X|L1].

/Ejercicio 2.4 (pertenencia o membresia)/

/Recursion/
pertenece(X,[A|L]) :- X == A ; pertenece(X,L). 

/*
    1. ¿Es c un elemento de [a,c,b,c]?
    2. ¿Cuáles son los elementos de [a,b,a] ?
    3. ¿Cuáles son los elementos comunes de [a,b,c], y [d,c,b] ?
*/

/Ejercicio 2.5 (concatenacion)/

/Recursion/
conc([],B,B).
conc([X|D],B,[X|E]) :- conc(D,B,E).

/*
    1. ¿Qué lista hay que añadirle a la lista [a,b] para obtener [a,b,c,d]?
    2. ¿Qué listas hay que concatenar para obtener [a,b]?
    3. ¿Pertenece b a la lista [a,b,c]?
    4. ¿Es [b,c] una sublista de [a,b,c,d]?
    5. ¿Es [b,d] una sublista de [a,b,c,d]?
    6. ¿Cuál es el último elemento de [b,a,c,d]?
*/