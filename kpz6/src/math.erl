-module(math).
-export([
    reverse/1,
    rand_uniform/2
]).

% tail recursion == cool
reverse(X) -> reverse_(X, []).
reverse_([], R) -> R;
reverse_([H|T], R) -> reverse_(T, [H|R]).

rand_uniform(From, To) when(From < To) ->
	Diff = To - From,
	rand:uniform(Diff) + From.