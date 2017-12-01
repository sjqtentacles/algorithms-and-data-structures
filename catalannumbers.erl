-module(catalannumbers).
-compile(export_all).

catalan(0) -> 1;
catalan(N) -> lists:sum(
                lists:map(fun(X) -> catalan(X)*catalan(N-1-X) end, lists:seq(0,N-1))
                ).
