-module(coinproblem).
-export([coins/2]).

%taken from https://codereview.stackexchange.com/questions/109970/coins-problem-in-erlang
%still trying to understand this one, or maybe I'm not understanding the problem properly...

coins(_, 0) -> 1;
coins([], _) -> 0;
coins(_, Goal) when Goal < 0 -> 0;
coins([H|T] = Coins, Goal) ->
    coins(Coins, Goal - H) + coins(T, Goal).
