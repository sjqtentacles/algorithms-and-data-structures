-module(string_subsequence_removal).
-compile(export_all).

func([])
    -> [];
func([H | [ H | [H | T]]]) -> func(remove_rest, T, H);
func([H|T]) -> [H | func(T)].

func(remove_rest, [A| T], A) -> func(remove_rest, T, A);
func(remove_rest, [A| T] = X, B) -> func(X).


test() -> func([1,1,1,1,2,2,2,3,3,4,5,5,6]).
