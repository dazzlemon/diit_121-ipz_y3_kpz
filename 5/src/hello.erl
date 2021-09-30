-module(main_).

concat(N, M) ->
  lists:append(N, M).

main(_) ->
  io:format("Hello, world!\n"),
  List2 = concat([1, 2, 3], [4, 5]),
  io:fwrite("~w~n", [List2]).