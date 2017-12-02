-module(minimumstepstoone).
-compile(export_all).

% on a positive integer you can
% 1) subtract 1 from it
% 2) if it's divisible by 2, divide by 2
% 3) if it's divisible by 3, divide by 3
% Given a positive int N, find the min number of steps that takes n to 1.

solve(1) -> 0;
solve(N) when ((N rem 2 == 0) and (N rem 3 == 0))->
    1 + lists:min([solve(N-1), solve(N div 2), solve(N div 3)]);
solve(N) when (N rem 2 == 0) ->
    1 + lists:min([solve(N-1), solve(N div 2)]);
solve(N) when (N rem 3 == 0) ->
    1 + lists:min([solve(N-1), solve(N div 3)]);
solve(N) ->
    1 + solve(N-1).

% the solution is F(N) = 1 + min(F(N-1), F(N/2), F(N/3)) if N > 1 else 0
% the above formula was posted on codechef.com/wiki/tutorial-dynamic-programming
% but the code is my original creation
