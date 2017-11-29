-module(reverse_special_characters).
-compile(export_all).

%Following this problem:
%http://www.geeksforgeeks.org/reverse-an-array-without-affecting-special-characters/

%The solution here only works for one string of special character(s).

reverse(L) -> reverse(L, []).
reverse([], R) -> R;
reverse([H|T], R) -> reverse(T, [H|R]).

special_reverse(List, SpecChar) ->
    SplitList = string:split(List, SpecChar),
    string:join(lists:map(fun ?MODULE:reverse/1, SplitList), SpecChar).
