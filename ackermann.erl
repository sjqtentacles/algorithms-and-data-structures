-module(ackermann).
-export([ackermann/2]).

%https://en.wikipedia.org/wiki/Ackermann_function
%added memoization but that doesn't help, it's too monstrously large

ackermann(M, N) ->
    case ets:info(acker_memo) of
        undefined ->
            ets:new(acker_memo, [named_table]);
        _ -> ok
    end,
    ackermann(compute, M, N).

ackermann(compute, M, N) when M == 0 ->
    N + 1;

ackermann(compute, M, N) when ((M > 0) and (N == 0)) ->
    case ets:lookup(acker_memo, {M, N}) of
        [] ->
            AckerNum = ackermann(compute, M-1, 1),
            ets:insert_new(acker_memo, {{M, N}, AckerNum}),
            AckerNum;
        [{_, Value}] -> Value
    end;

ackermann(compute, M, N) when ((M > 0) and (N > 0)) ->
    case ets:lookup(acker_memo, {M, N}) of
        [] ->
            AckerNum = ackermann(compute, M-1, ackermann(compute, M, N-1)),
            ets:insert_new(acker_memo, {{M, N}, AckerNum}),
            AckerNum;
        [{_, Value}] -> Value
    end.
