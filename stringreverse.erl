-module(stringreverse).
-export([reverse/1]).

%fun pattern matching implementation

reverse(String) ->
    reverse(String, []).

reverse([], Reverse) ->
    Reverse;

reverse([H|T], Reverse) ->
    reverse(T, [H|Reverse]).
