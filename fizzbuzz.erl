-module(fizzbuzz).
-compile(export_all).

fizzbuzz(X) when (X rem 3 == 0 ) and (X rem 5 ==0) ->
    "FizzBuzz";
fizzbuzz(X) when (X rem 3 == 0) ->
    "Fizz";
fizzbuzz(X) when (X rem 5 == 0) ->
    "Buzz";
fizzbuzz(X) ->
    X.

test() ->
    lists:map(fun ?MODULE:fizzbuzz/1, lists:seq(1,100)).
