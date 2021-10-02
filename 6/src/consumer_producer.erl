-module(consumer_producer).
-export([
	buffer/1,
	producer/2,
	consumer/2
]).
-import(math, [
	reverse/1,
	rand_uniform/2
]).

buffer(Buf) -> 
	io:format("Buffer = ~w~n", [Buf]), 
	receive
		%% реализовать по заданию структуру буфера
		{get, Pid} when (length(Buf) > 0) -> 
			[H|T] = Buf,
			Pid!{item, H},
			buffer(T);
		{put, Value} -> buffer(Buf ++ Value);
		{clear} -> buffer([]);
		{stop} -> ok 
	end.

producer(NumberProc, 0) -> io:format("Producer~w finished ~n", [NumberProc]);
producer(NumberProc, CountIter) ->
	% rand:seed(exs928ss, [NumberProc, CountIter, 0]),
	Elem = [NumberProc|produce(4)],
	io:format("Thread ~w produced ~w~n", [NumberProc, Elem]),
	base!{put, Elem}, 
	producer(NumberProc, CountIter - 1).

produce(X) ->
	[rand_uniform(-5, 5) || _ <- lists:seq(1, X)].

consumer(NumberProc, 0) -> io:format("Consumer~w finished ~n",[NumberProc]);
consumer(NumberProc, CountIter) ->
	base!{get,self()},
	receive 
		{item, Elem} -> 
			io:format("Thread~w consumed ~w~n", [NumberProc, consume(Elem)]),
			consumer(NumberProc, CountIter - 1);
		{stop} -> ok
	end.

consume(X) -> reverse(X).