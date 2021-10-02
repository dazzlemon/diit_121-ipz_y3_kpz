-module(main_).
-import(consumer_producer, [reverse/1]).

main(_) ->
    L1 = [1, 2, 3, 4, 5],
    L2 = reverse(L1),
    io:fwrite("revese(~w) -> ~w~n", [L1, L2]).