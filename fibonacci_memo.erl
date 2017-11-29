-module(fibonacci_memo).
-export([fib/1]).

fib(N) ->
    case ets:info(fib_memo) of
        undefined ->
            ets:new(fib_memo, [named_table]),
            ets:insert_new(fib_memo, {0,0}),
            ets:insert_new(fib_memo, {1,1});
        _ -> ok
    end,
    fibonacci(N).

fibonacci(N) ->
    case ets:lookup(fib_memo, N) of
        [] ->
            FibNum = fibonacci(N-1) + fibonacci(N-2),
            ets:insert_new(fib_memo, {N, FibNum}),
            FibNum;
        [{_, Value}] ->
            Value
    end.
