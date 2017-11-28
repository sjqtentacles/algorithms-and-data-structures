-module(binarysearch).
-compile(export_all).

% much was copied from rosettacode implementation

search([], Value, Low, High) -> {error, "Empty list"};

search(List, Value, Low, High) ->
    if
        Low > High -> not_found;
        true ->
            Mid = (Low + High) div 2,
            MidNum = lists:nth(Mid, List),
            if
                MidNum > Value ->
                    search(List, Value, Low, Mid - 1);
                MidNum < Value ->
                    search(List, Value, Mid + 1, High);
                true -> Mid
            end
    end.
