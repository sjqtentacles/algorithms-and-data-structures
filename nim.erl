-module(nim).
-compile(export_all).

start() ->
    new().

new() ->
    [1,3,5].

legal_moves([A, B, C] = State) ->
    As = [[I, B, C] || I<- lists:seq(0, A-1)],
    Bs = [[A, I, C] || I<- lists:seq(0, B-1)],
    Cs = [[A, B, I] || I<- lists:seq(0, C-1)],
    As ++ Bs ++ Cs.

minimax(State) ->
    Moves = legal_moves(State),
    MoveScores = lists:map(fun(S) -> {minimax(S, player), S} end, Moves),
    {Score, BestMove} = lists:min(MoveScores),
    BestMove.

minimax(State, player) ->
    case lists:sum(State) of
        1 -> -10;
        0 -> 10;
        _ ->
            Moves = legal_moves(State),
            lists:max(lists:map(fun(S) -> minimax(S, opponent) end, Moves))
    end;

minimax(State, opponent) ->
    case lists:sum(State) of
        1 -> 10;
        0 -> -10;
        _ ->
            Moves = legal_moves(State),
            lists:min(lists:map(fun(S) -> minimax(S, player) end, Moves))
    end.
