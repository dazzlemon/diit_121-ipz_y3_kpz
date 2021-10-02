-module(main).
-import(consumer_producer, [
    buffer/1,
	producer/2,
	consumer/2
]).
-compile(export_all).

% main(_) ->
start() ->
	case whereis(base) of 
		undefined -> register(base, spawn(erl2, bufer, [[]]));
		_ -> base!{clear}
	end,
	io:format("Buffer initialized, all right!~n"),

	[spawn(main, producer, [X, 5]) || X <- lists:seq(1, 5)],

	[spawn(main, consumer, [X, 5]) || X <- lists:seq(1, 5)],
	io:format("Init finished....~n"). 