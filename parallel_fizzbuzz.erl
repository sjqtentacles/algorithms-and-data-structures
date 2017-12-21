-module(parallel_fizzbuzz).
-export([par/1]).

fizzbuzz(X) when (X rem 3 == 0 ) and (X rem 5 ==0) ->
    "FizzBuzz";
fizzbuzz(X) when (X rem 3 == 0) ->
    "Fizz";
fizzbuzz(X) when (X rem 5 == 0) ->
    "Buzz";
fizzbuzz(X) ->
    X.

par(N) ->
    Parent = self(),
    [receive {Pid, Result} -> Result end || Pid <-
        [spawn(fun() -> Parent ! {self(), fizzbuzz(X)} end) || X <- lists:seq(1, N)]].
