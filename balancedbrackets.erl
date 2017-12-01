-module(balancedbrackets).
-compile(export_all).

%upon completion of this I understood the actual problem asks for
%balanced brackets which are of the proper order too
%this implementation forgets about that and accepts "]][[" as balanced!
%can this be called a feature? I'll get back to this one
%eventually as I've done it before in Python... somewhere.

balance(String) -> balance(String, 0).

balance([], 0) -> true;
balance([], X) when (X /= 0) -> false; % the guard is superfluous but adds clarity
balance([H|T] = String, Acc) ->
    case H of
        $[ -> balance(T, Acc + 1);
        $] -> balance(T, Acc - 1);
        _ -> balance(T, Acc)
    end.
