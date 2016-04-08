is_even(X) :-
	0 is X mod 2.

fact(0, Factorial) :-
	Factorial is 1.

%Does this need to do negative?

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





segregate(list, Even, Odd) :-