-module(bits).
-compile(export_all). 

-define(BUY_NUMS,lists:seq(1,8)).

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

win_count(Buy, Result) ->
	case is_win(Buy, Result) of
		true -> 
			combination(length(Buy) - 5 ,2);
		false -> 
			0
	end.

factorial(N) -> factorial(1, N, 1).
factorial(M, N, R) when M =< N ->
  factorial(M+1, N, R*M);
factorial(_, N, R) when N >= 0 -> R.

permutation(N,R) ->
  factorial(N) div factorial(N-R).

combination(N, R) ->
  permutation(N, R) div factorial(R).
  
permute([]) -> 
	[[]];
permute(L) -> 
	[[X|Y] || X<-L, Y<-permute(L--[X])].

combination_seq(0,_) ->
    [[]];
combination_seq(_,[]) ->
    [];
combination_seq(N,[H|T]) ->
    [[H|L] || L <- combination_seq(N-1,T)]++combination_seq(N,T).
    
win_count_test() ->
	Start = erlang:timestamp(),
	Combs = combination_seq(5, lists:seq(1,11)),
	print_comb(Combs),
	End = erlang:timestamp(),
	timer:now_diff(End,Start).
	
print_comb([]) ->
	ok;
print_comb([H|L]) ->
	print_perm(permute(H)),
	print_comb(L).
	
print_perm([]) ->
	ok;
print_perm([H|L]) ->
	win_count(?BUY_NUMS,H),
	print_perm(L).
