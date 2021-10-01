-module(main_).

append([X|Xs], Ys) ->
    [X|append(Xs, Ys)];
append([], Ys) ->
    Ys.

filter(P, L) ->
  [ X || X <- L, P(X) ].

% filter(_, []) -> [];
% filter(P, [X|Xs]) ->
%   case P(X) of
%     true -> [X|filter_list(P, Xs)];
%     false -> filter_list(P, Xs)
%   end.

countNumsAtomsTuples(Xs) ->
  Nums   = filter(fun erlang:is_number/1, Xs),
  Atoms  = filter(fun erlang:is_atom  /1, Xs),
  Tuples = filter(fun erlang:is_tuple /1, Xs),
  {length(Nums), length(Atoms), length(Tuples)}.

main(_) ->
  {L1, L2} = {[1, 2, 3], [4, 5]},
  List = append(L1, L2),
  io:fwrite("append(~w, ~w) -> ~w~n", [L1, L2, List]),

  List2 = [atom1, 1, {tuple, 1}, atom2, 3, 7],
  {Nums, Atoms, Tuples} = countNumsAtomsTuples(List2),
  io:fwrite("~w has ~w numbers, ~w atoms and ~w tuples~n", [List2, Nums, Atoms, Tuples]).