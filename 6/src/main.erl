-module(main).
-export([main/1]).
-import(consumer_producer, [
    buffer/1,
	producer/2,
	consumer/2
]).

main(_) ->
	case whereis(base) of 
		undefined -> register(base, spawn(consumer_producer, buffer, [[]]));
		_ -> base!{clear}
	end,
	io:format("Buffer initialized, all right!~n"),

	[spawn(consumer_producer, producer, [X, 5]) || X <- lists:seq(1, 5)],

	[spawn(consumer_producer, consumer, [X, 5]) || X <- lists:seq(1, 5)],
	io:format("Init finished....~n").