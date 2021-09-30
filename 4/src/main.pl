% kpz4
% 1
sumPositive(Xs, N) :-
    include([X]>>(X > 0), Xs, PositiveXs),
    foldl(plus, PositiveXs, 0, N).
  
% 3
unmerge(Xs, Ys, Zs, Ytype, Ztype) :-
    include([X]>>is_of_type(Ytype, X), Xs, Ys),
    include([X]>>is_of_type(Ztype, X), Xs, Zs).

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