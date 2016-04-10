is_even(X) :-
	0 is X mod 2.

fact(0, Factorial) :-
	Factorial is 1.

fact(X, Factorial) :-
	X > 0,
	XTemp is X - 1,
	fact(XTemp, FactorialTemp),
	Factorial is X * FactorialTemp.





divisible(X, Y) :-
	(X > Y,
	0 is X mod Y) ;
	(YTemp is Y + 1,
	divisible(X, YTemp)).

is_prime(X) :- 
	X > 1,
	%not(divisible(X, 1)).
	divisible(X, 2).


segregate([], Even, Odd) :-
	nl,
	write(Even),
	%Even is Even,
	nl,
	write(Odd).
	%Odd is Odd.


segregate([H | T], Even, Odd) :-
	%write(H), nl,

	( is_even(H) -> 
	write("I'm even! "),
	write(H), nl,
	append(Even, [H], EvenOne)
	;
	write("I'm odd!  "),
	write(H), nl,
	append(Odd, [H], OddOne)),


	%append(Even, [H], EvenOne),
	%append(Odd, [H], OddOne),
	%write(EvenOne),
	%write(OddOne),
	segregate(T, EvenOne, OddOne).



