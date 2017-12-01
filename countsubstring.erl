-module(countsubstring).
-export([substring/2]).

substring([], Sub) -> 0;
substring([H|T] = Original, Sub) ->
    match(Original, Sub) + substring(T, Sub).

match([], [A|B] = Sub) -> 0;
match(X, []) -> 1;
match([H|T] = Orig, [A|B] = Sub) ->
    case (H == A) of
        true -> match(T, B);
        false -> 0
    end.
