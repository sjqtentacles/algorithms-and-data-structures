-module(frobenius).
-compile(export_all).

checker(lengths, [H|T]) ->
    lists:all(fun(X) -> X==H end, T).
checker([H|T] = List) ->
    Lens = lists:map(fun(X) -> length(X) end, List),
    case checker(lengths, Lens) of
        false -> {error, "not a proper matrix"};
        true -> {ok, "success!"}
    end.

sumlist(List) ->
    lists:foldl(fun(A,B) -> (A+B) end, 0, List).

square(X) -> X*X.

frobenius(List) ->
    {Result, Reason} = checker(List),
    case Result of
        ok ->
            Squares = lists:flatmap(fun(X) -> lists:map(fun ?MODULE:square/1, X) end, List),
            SumOfSquares = sumlist(Squares),
            io:format("~p~n~p~n", [Squares, SumOfSquares]),
            math:sqrt(SumOfSquares);
        error -> Reason
    end.
