-module(longestsubstring).
-compile(export_all).

lcs(A,B) ->
    lcs(A,B,[])
