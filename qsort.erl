-module(qsort).
-compile(export_all).

sort([]) -> [];
sort([X]) -> [X];
sort([H|T]) -> sort([I || I<-T, I<H]) ++ [H] ++ sort([I || I<-T, I>H]).
