-module(coins).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

count(N, L) ->
	flatten(count(N, L, []),[]).
count(0, _, Ways) ->
	Ways;
count(N, _, _) when N < 0 ->
	[];
count(_, [], _) ->
	[];
count(N, [H | T]=Coins, Ways) ->
	WithFirstCoin = count(N - H, Coins, [H | Ways]),
	WithOutFirstCoin = count(N, T, Ways),
	[WithFirstCoin,WithOutFirstCoin].

flatten([], Result) ->
	Result;
flatten([H | T] = L, Result) ->
	case is_list(H) of
		false -> [L | Result];
		true -> flatten(T, flatten(H, Result))
	end.

test() ->
	?assertEqual([[1,1,1],[2,1],[3]], lists:sort(count(3,[1,2,3]))),
	?assertEqual([[2,2,2,2,2],[3,3,2,2],[5,3,2],[5,5]], lists:sort(count(10,[2,3,5]))).