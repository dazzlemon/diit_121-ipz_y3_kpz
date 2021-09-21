% fact name     X  Y  Z
% matrix declaration(name and dimensions)
tensor3Declaration(tensor3_1, 3, 3, 3).

% fact name     X  Y  Z Val
% cell's value assignment(name, indices and value)
% cells without explicit value considered as 0's
tensor3(tensor3_1, 1, 1, 1, 1).
tensor3(tensor3_1, 1, 1, 2, 3).
tensor3(tensor3_1, 1, 1, 3, -7).

tensor3(tensor3_1, 2, 1, 1, 5).
tensor3(tensor3_1, 2, 1, 2, 16).
tensor3(tensor3_1, 2, 1, 3, 5).

tensor3(tensor3_1, 3, 1, 1, 14).
tensor3(tensor3_1, 3, 1, 2, 1).
tensor3(tensor3_1, 3, 1, 3, 25).

tensor3(tensor3_1, 3, 3, 3, -100).

verifyIndex(I, IMax) :-
  is_of_type(positive_integer, I),
  I =< IMax.

correctTensor3Declaration(Name, X, Y, Z) :-
  tensor3Declaration(Name, X, Y, Z),
  is_of_type(positive_integer, X),
  is_of_type(positive_integer, Y),
  is_of_type(positive_integer, Z).

processIndex(I, Imax) :-
  (var(I), verifyIndex(I, Imax)); (!, between(1, Imax, I)).

tensor3Val(Name, X, Y, Z, Val) :-
  (correctTensor3Declaration(Name, Xmax, Ymax, Zmax); fail),
  processIndex(X, Xmax),
  processIndex(Y, Ymax),
  processIndex(Z, Zmax),
  (tensor3(Name, X, Y, Z, Val); Val=0).

tensor3IsCubic(tensor3_1) :-
  tensor3Declaration(tensor3_1, X, X, X).

printlist([]).
printlist([X|List]) :-
    writeln(X),
    printlist(List).

:-
  tensor3Val(tensor3_1, 1, 1, 1, Val), writeln('val at (1, 1, 1)' = Val),
  write('is 3x3x3 matrix cubic? - '), (tensor3IsCubic(tensor3_1), writeln(true)) ; writeln(false).

:-
  findall(X:Y:Z/V, tensor3Val(tensor3_1, X, Y, Z, V), Results), printlist(Results).
