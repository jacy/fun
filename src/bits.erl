-module(bits).
-compile(export_all). 

win_count(Buy, Result) ->
	case is_win(Buy, Result) of
		true -> 
			combination(length(Buy) - 5 ,2);
		false -> 
		0
	end.
	
int_to_bit(Num) ->
	1 bsl Num.

ints_bits(R) ->
	ints_bits(R, 0).
ints_bits([], R) ->
	R;
ints_bits([H | L], R) ->
	ints_bits(L, R bor int_to_bit(H)).

is_win(Buy, Result) ->
	BuyBits = ints_bits(Buy),
	ResultBits = ints_bits(Result),
	(BuyBits band ResultBits) == ResultBits.

factorial(N) -> factorial(1, N, 1).
factorial(M, N, R) when M =< N ->
  factorial(M+1, N, R*M);
factorial(_, N, R) when N >= 0 -> R.

permutation(N,R) ->
  factorial(N) div factorial(N-R).

combination(N, R) ->
  permutation(N, R) div factorial(R).
