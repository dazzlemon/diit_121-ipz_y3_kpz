-module(main).

splitfilter(Xs, Ps) ->
  lists:foldl(
    fun (X, Rs) ->
      splitfilter_item(X, Ps, Rs) end,
    [0 || _ <- Ps], Xs).

splitfilter_item(I, [P|Ps], [R|Rs]) ->
  case P(I) of
    true  -> [R + 1|Rs];
    false -> [R    |splitfilter_item(I, Ps, Rs)]
  end.

main(_) ->
  List2 = [atom1, 1, {tuple, 1}, atom2, 3, 7],
  [N, A, T] = splitfilter(List2, [
    fun erlang:is_number/1,
    fun erlang:is_atom  /1,
    fun erlang:is_tuple /1
  ]),
  io:fwrite("~w has ~w numbers, ~w atoms and ~w tuples~n", [List2, N, A, T]).