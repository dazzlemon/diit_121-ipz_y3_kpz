% kpz4
% 1
sumPositive(Xs, N) :-
    include([X]>>(X > 0), Xs, PositiveXs),
    foldl(plus, PositiveXs, 0, N).

% 2
% L = {aa-b^n; a^n+bc^m}. m>0,  n>0.

% edge(StartState, EndState, EdgeVal)
:- discontiguous edge/2, edge/3.

edge(start, q0).
edge(q0, q1, a).
edge(q1, q2, a).
edge(q2, q3, -).
edge(q3, q3, b).
edge(q3, end, b).

edge(start, q4).
edge(q4, q5, a).
edge(q5, q5, a).
edge(q5, q6, +).
edge(q6, q7, b).
edge(q7, q7, c).
edge(q7, end, c).

accept([], end).
accept([H|T], CurrentState) :-
    edge(CurrentState, NextState, H),
    accept(T, NextState).
accept(List) :-
    edge(start, NextState),
    accept(List, NextState), !.
% cut to not check other ways if already accepted
accept(Atom) :-
    atom(Atom),
    atom_chars(Atom, Chars),
    accept(Chars).
% less typing

% 3
unmerge(Xs, TypeListPairs) :-
    maplist(
        [Type-List]>>include(
            [X]>>is_of_type(Type, X), Xs, List),
        TypeListPairs).

unmerge(Xs, Ys, Zs, Ytype, Ztype) :-
    TypeListPairs = [Ytype-Ys, Ztype-Zs],
    unmerge(Xs, TypeListPairs).

:-
    A = [
        1, -1,
        2, -2,
        3, -3],
    sumPositive(A, N),
    writeln('sumPositive([1, -1, 2, -2, 3, -3])' = N).

:- 
    A = [
        1, atom1,
        2, atom2,
        3, atom3],
    unmerge(A, Atoms, Ints, atom, integer),
    writeln(Atoms),
    writeln(Ints).