include_(_, [], []).
include_(Predicate, [X|Xs], Included) :-
    (   call(Predicate, X)
    ->  Included = [X|Included_]
    ;   Included = Included_
    ),
    include_(Xs, Predicate, Included_).

foldl_([], _, V, V).
foldl_([X|Xs], Predicate, V0, V) :-
    call(Goal, X, V0, V1),
    foldl_(Xs, Predicate, V1, V).

maplist_([], _).
maplist_([X|Xs], Goal) :-
    call(Goal, X),
    maplist_(Xs, Goal).