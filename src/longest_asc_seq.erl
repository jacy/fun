-module(longest_asc_seq).
-include_lib("eunit/include/eunit.hrl").
-compile(export_all). 

las(L) ->
    lcs(L,lists:sort(L), []).

lcs([],_,Acc) ->
    Acc;
lcs(_,[],Acc) ->
    Acc;
lcs([Same|ST], [Same|TT], _)->
    [Same | lcs(ST,TT,[])];
lcs(S, T, Acc) ->
    LCS1 = lcs(tl(S), T, Acc),
    LCS2 = lcs(S, tl(T), Acc),
    case length(LCS1) < length(LCS2) of
        true -> LCS2;
        false ->LCS1
    end.

lcs_test() ->
    ?assertEqual([1, 9, 10, 11, 12], las([1, 9, 12, 10, 11, 12])),
    ?assertEqual([1, 2, 4, 5, 6], las([1, 2, 10, 13, 4, 5, 6])),
    ?assertEqual([1, 2, 4, 5], las([1, 2, 10, 4, 5])),
    ?assertEqual([1,2,3,4,5,6,7,8,8,8,9,10,11,12], las([1, 2, 3, 5, 6, 7, 4, 5, 6, 7, 8, 8, 8, 9, 10, 11, 12,3])).
