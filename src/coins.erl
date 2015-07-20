-module(coins).
-compile(export_all). 

count(N, L) ->
print(count(N, L, [])).

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

print([]) ->
	ok;
print([H | T] = L) ->
	case is_list(H) of
		false -> io:format("~w~n",[L]);
		true -> print(H), print(T)
	end.
