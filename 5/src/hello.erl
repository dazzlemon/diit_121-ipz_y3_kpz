-module(main_).

append([X|Xs], Ys) ->
    [X|append(Xs, Ys)];
append([], Ys) ->
    Ys.

countNumsAtomsTuples(Xs) -> countNumsAtomsTuples_(Xs, {0, 0, 0}).
countNumsAtomsTuples_([], R) -> R;
countNumsAtomsTuples_([H|T], {N, A, Tu}) ->
  if
    is_number(H) -> countNumsAtomsTuples_(T, {N + 1, A,     Tu});
    is_atom(H)   -> countNumsAtomsTuples_(T, {N,     A + 1, Tu});
    is_tuple(H)  -> countNumsAtomsTuples_(T, {N,     A,     Tu + 1})
  end.

main(_) ->
  {L1, L2} = {[1, 2, 3], [4, 5]},
  List = append(L1, L2),
  io:fwrite("append(~w, ~w) -> ~w~n", [L1, L2, List]),

  List2 = [atom1, 1, {tuple, 1}, atom2, 3, 7],
  {Nums, Atoms, Tuples} = countNumsAtomsTuples(List2),
  io:fwrite("~w has ~w numbers, ~w atoms and ~w tuples~n", [List2, Nums, Atoms, Tuples]).