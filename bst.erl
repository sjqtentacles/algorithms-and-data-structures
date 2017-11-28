-module(bst).
-export([bst_create/0, b

% bst_create(), bst_insert(Bst, N), and bst_search(Bst,N) are copied from
% https://gist.github.com/vedantk/1432100
% the rest is my own implementation

bst_create() -> [].

bst_insert(Bst, [H|T]) -> bst_insert(bst_insert(Bst, H), T);
bst_insert(Bst, N) ->
  case Bst of
    [] -> [N, [], []];
    [Root, Lhs, Rhs] ->
      if
        N == Root -> Bst;
        N < Root -> [Root, bst_insert(Lhs, N), Rhs];
        N > Root -> [Root, Lhs, bst_insert(Rhs, N)]
      end
  end.

bst_search(Bst, N) ->
  case Bst of
    [] -> false;
    [Root, Lhs, Rhs] ->
      if
        N == Root -> true;
        N < Root -> bst_search(Lhs, N);
        N > Root -> bst_search(Rhs, N)
      end
  end.

%need to write a method for balancing the tree
