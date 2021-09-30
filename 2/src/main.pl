:- ensure_loaded("facts.pl").

tensor3Val(Name, X, Y, Z, Val) :-
  tensor3Declaration(Name, Xmax, Ymax, Zmax),
  between(1, Xmax, X),
  between(1, Ymax, Y),
  between(1, Zmax, Z),
  (tensor3(Name, X, Y, Z, Val) -> true; Val=empty).

tensor3IsCubic(Name) :-
  tensor3Declaration(Name, X, X, X).

min(Name, X, Y, Z, V) :-
  tensor3(Name, X, Y, Z, V), not((tensor3(Name, _, _, _, V1), V1 < V)).

:-
  tensor3Val(tensor3_1, 1, 1, 1, Val), writeln(1:1:1/Val),
  nl, write('is 3x3x3 matrix cubic? - '),
  (tensor3IsCubic(tensor3_1) -> writeln(true); writeln(false)).

:- tensor3Val(tensor3_1, X, Y, Z, V), writeln(X:Y:Z/V), fail; true.
:- nl, min(tensor3_1, X, Y, Z, V), writeln(min=X:Z:Y/V).