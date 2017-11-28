-module(linkedlist).
-compile(export_all).

new() -> [].
new([H|T]) -> [H|T];
new(X) -> [X].

insert(LinkedList, X) -> [X| LinkedList];
insert(LinkedList, [H|T]) -> insert([H|LinkedList], T).

nth([], N) -> {error, "oops"};
nth([X], 0) -> X;
nth([H|T], 0) -> H;
nth([H|T], N) ->
    nth(T, N-1).

peek([]) -> {error, "Empty"};
peek([H|T]) -> H.

pop([]) -> [];
pop([H|T]) -> T.
