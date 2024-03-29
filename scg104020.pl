%!	Scott Gaydos, scg104020
%!	CS 4337.001
%!	4.11.2015



%! --------------------------------------------------------------

%! 1. Even
%! This function determines if something is even or not by taking the mod of the number and inspecting whether the output is 0 or 1.

is_even(X) :-
	0 is X mod 2.


%! --------------------------------------------------------------

%! 2. Factorial
%! This function calulcates the factorial of a number greater than 0 since factorial for all numbers less that 0 is undefined.

fact(0, Factorial) :-
	Factorial is 1.

fact(X, Factorial) :-
	X > 0,
	XTemp is X - 1,
	fact(XTemp, FactorialTemp),
	Factorial is X * FactorialTemp, !.


%! --------------------------------------------------------------

%! 3. Prime
%! This function determines if a variable passed to it is prime or not.

divisible(X, Y) :- 0 is X mod Y, !.

divisible(X, Y) :-
	X > Y + 1,
	YTemp is Y + 1,
	divisible(X, YTemp).

is_prime(2) :-
	true, !.

is_prime(X) :- 
	not(divisible(X, 2)).


%! --------------------------------------------------------------

%! 4. Segregate
%! This function seperates a list into two different lists based on even and odd values.
%! This function finds the lists and prints them out but does not return them.

segregate([], Even, Odd) :-
	nl,
	write(Even),
	%Even is [E],
	nl,
	write(Odd).
	%Odd is O.


segregate([H | T], Even, Odd) :-
	%write(H), nl,

	( is_even(H) -> 
	%write("I'm even! "),
	%write(H), nl,
	append(Even, [H], EvenOne),
	segregate(T, EvenOne, Odd)
	%Even = EvenOne
	;
	%write("I'm odd!  "),
	%write(H), nl,
	append(Odd, [H], OddOne),
	segregate(T, Even, OddOne)
	).


%! --------------------------------------------------------------

%! 5. Product List
%! This function takes a list and produces the multiplicative product of all the numbers within the list.

prod_list([], Product) :-
	Product is 1.

prod_list([H | T], Product) :-
	prod_list(T, ProductTemp),
	Product is H * ProductTemp.


%! --------------------------------------------------------------

%! 6. Bookends
%! This function takes three lists and determines if the first list is a prefix of the third and the second argument is a suffix of the third.

ending([], []) :-
	true, !.

ending([], [H | T]) :-
	false, !.

ending([H1 | T1], [H2 | T2]) :-
	H1 is H2,
	ending(T1, T2), !;
	ending([H1 | T1], T2), !.

beginning([], []) :-
	true, !.

beginning([], [H | T]) :-
	true, !.

beginning([H | T], [H2 | T2]) :-
	H is H2,
	beginning(T, T2), !.


bookends([H | T], [H1 | T1], [H2 | T2]) :-
	beginning([H | T], [H2 | T2]),
	ending([H1 | T1], [H2 | T2]).


%! --------------------------------------------------------------

%! 7. Subslice
%! This function takes two list and determines if one is a piece of the other.

subsliceHelper([], []) :-
	true,!. 

subsliceHelper([H | T], []) :-
	false.

subsliceHelper([], [H | T]) :-
	true.

subsliceHelper([H | T], [H1 | T1]) :-
	(
	H is H1 ->
	subsliceHelper(T, T1)
	;
	false
	).

subslice([H | T], []) :-
	false.

subslice([H | T], [H1 | T1]) :-
	(
	H is H1 ->
	subsliceHelper(T, T1)
	;
	subslice([H | T], T1)
	).


%! --------------------------------------------------------------

%! 8. Clue
%! This function simulates a run of the game clue and adds one predicate to complete the game


affairHaving(X, Y) :- havingAffair(X, Y).
affairHaving(X, Y) :- havingAffair(Y, X), !.

affairHaving(mrBoddy, msGreen).
affairHaving(mrBoddy, missScarlet).

married(profPlum, msGreen).
married(msGreen, profPlum).

veryRich(mrBoddy).

greedy(colMustard).

greed(X, Y) :-
	greedy(X), 
	not(veryRich(X)),
	veryRich(Y).

hatred(X, Y) :-
	havingAffair(X, Z),
	married(Z, Y).

murder(X, Y) :-
	hatred(X, Y);
	greed(X, Y).


%! Not sure why this is only getting false and not getting the suspects
suspect(Killer, mrBoddy) :-
	murder(Killer, myBoddy).

%! --------------------------------------------------------------