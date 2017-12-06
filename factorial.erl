-module(factorial).
-export([factorial/1]).

factorial(1) -> 1;
factorial(X) -> X*factorial(X-1).
