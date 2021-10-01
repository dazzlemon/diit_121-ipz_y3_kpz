-module(main_).

append([X|Xs], Ys) ->
    [X|append(Xs, Ys)];
append([], Ys) ->
    Ys.

filter_(P, L) ->
  [ X || X <- L, P(X) ].

countNumsAtomsTuples(Xs) ->
  Nums   = filter_(is_number, Xs),
  Atoms  = filter_(is_atom,   Xs),
  Tuples = filter_(is_tuple,  Xs),
  {length(Nums), length(Atoms), length(Tuples)}.

% filter_(_, []) -> [];
% filter_(P, [X|Xs]) ->
%   case P(X) of
%     true -> [X|filter_list(P, Xs)];
%     false -> filter_list(P, Xs)
%   end.

main(_) ->
  List = append([1, 2, 3], [4, 5]),
  %NumAtomTupleCount = countNumsAtomsTuples([atom1, 1, {tuple, 1}, atom2, 3, 7]),
  io:fwrite("~w~n", [List]).