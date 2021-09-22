:- ensure_loaded("facts.pl").

verifyIndex(I, IMax) :-
  is_of_type(positive_integer, I),
  I =< IMax.

correctTensor3Declaration(Name, X, Y, Z) :-
  tensor3Declaration(Name, X, Y, Z),
  is_of_type(positive_integer, X),
  is_of_type(positive_integer, Y),
  is_of_type(positive_integer, Z).

processIndex(I, Imax) :-
  nonvar(I) -> verifyIndex(I, Imax); between(1, Imax, I).

tensor3Val_(Name, X, Y, Z) :-
  correctTensor3Declaration(Name, Xmax, Ymax, Zmax),
  processIndex(X, Xmax),
  processIndex(Y, Ymax),
  processIndex(Z, Zmax).

tensor3Val(Name, X, Y, Z, Val) :-
  tensor3Val_(Name, X, Y, Z),
  (tensor3(Name, X, Y, Z, Val) -> true; Val=empty).

tensor3IsCubic(tensor3_1) :-
  tensor3Declaration(tensor3_1, X, X, X).

min(Name, V) :-
  tensor3(Name, _, _, _, V), not((tensor3(Name, _, _, _, V1), V1 < V)).

printTensor3(Name) :-
  tensor3Declaration(Name, Xmax, Ymax, Zmax),
  between(1, Xmax, X), between(1, Ymax, Y), between(1, Zmax, Z),
  tensor3Val(Name, X, Y, Z, V), writeln(X:Z:Y/V), fail; true.

printlist([]).
printlist([X|List]) :-
    writeln(X),
    printlist(List).

:-
  tensor3Val(tensor3_1, 1, 1, 1, Val), writeln('val at (1, 1, 1)' = Val),
  write('is 3x3x3 matrix cubic? - '), (tensor3IsCubic(tensor3_1), writeln(true)) ; writeln(false).

:-
  findall(X:Y:Z/V, tensor3Val(tensor3_1, X, Y, Z, V), Results), printlist(Results).

:- nl, printTensor3(tensor3_1).
:- nl, min(tensor3_1, X), writeln(min=X).
  