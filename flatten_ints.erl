-module(flatten_ints).
-export([flatten/1, test/0]).

% I also wrote a scala one from the prolog 99 problems set - but this was a while back
% located here: https://github.com/Nixonite/scala-99/blob/master/p07.scala


% base cases here
flatten([]) -> [];
flatten([[]|T]) -> flatten(T);

% if the head is a list, extract the head and continue
flatten([[X|Xs] | T]) ->
	flatten([X|[Xs|T]]);

% alternatively, this code below could be used to concatenate the remaining two tail lists, but
% list concatenation is inefficient for any long lengths since these are linked lists
% but still, might be good if the lists are expected to be short?

% flatten([[X|Xs] | T]) ->
% 	flatten([X| (Xs ++ T)]).


% last case, extract the head and flatten the rest
flatten([H|T]) -> [H|flatten(T)];

flatten(X) -> error.


test() ->
	[1,2,3] = flatten([1,2,[3]]),
	[] = flatten([]),
	error = flatten(3),
	[3,4,5] = flatten([[3],[4],5]),
	[1] = flatten([1]),
	[1] = flatten([[[1]]]),
	ok.