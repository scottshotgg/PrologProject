is_even(X) :-
	0 is X mod 2.

fact(0, Factorial) :-
	Factorial is 1.

fact(X, Factorial) :-
	X > 0,
	XTemp is X - 1,
	fact(XTemp, FactorialTemp),
	Factorial is X * FactorialTemp.