% kpz4
% 1
sumPositive(Xs, N) :-
    include([X]>>(X > 0), Xs, PositiveXs),
    foldl(plus, PositiveXs, 0, N).
  
% 3
unmerge(Xs, TypeListPairs) :-
    maplist(
        [Type-List]>>include(
            [X]>>is_of_type(Type, X), Xs, List),
        TypeListPairs).

unmerge(Xs, Ys, Zs, Ytype, Ztype) :-
    TypeListPairs = [Ytype-Ys, Ztype-Zs],
    unmerge(Xs, TypeListPairs).

:- A = [
    1, -1,
    2, -2,
    3, -3],
    sumPositive(A, N),
    writeln('sumPositive([1, -1, 2, -2, 3, -3])' = N).

:- A = [
    1, atom1,
    2, atom2,
    3, atom3],
    unmerge(A, Atoms, Ints, atom, integer),
    writeln(Atoms),
    writeln(Ints).