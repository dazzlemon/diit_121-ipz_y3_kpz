-module(main_).

% tail recursion == cool
reverse(X) -> reverse_(X, []).
reverse_([], R) -> R;
reverse_([H|T], R) -> reverse_(T, [H|R]).

main(_) ->
    L1 = [1, 2, 3, 4, 5],
    L2 = reverse(L1),
    io:fwrite("revese(~w) -> ~w~n", [L1, L2]).