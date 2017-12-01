-module(stringpermutationchecker).
-compile(export_all).

% not efficient but very short
is_permutation(A, B) ->
    case (A -- B) ++ (B -- A) of
        [] -> true;
        _ -> false
    end.
