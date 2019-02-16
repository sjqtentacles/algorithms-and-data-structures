-module(babylonian_algorithm).
-export([sqrt/1]).

sqrt(Num) ->
    case Num of
        1 -> Num;
        0 -> Num;
        _ -> sqrt(Num, Num/2)
    end.

sqrt(Num, Guess) ->
    X1 = ((Guess + Num/Guess)/2),
    case (abs(Num - X1*X1) < 0.00000001) of
        true -> X1;
        false -> sqrt(Num, X1)
    end.