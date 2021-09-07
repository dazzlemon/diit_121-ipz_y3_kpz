% fact name     X  Y  Z
matrix(matrix1, 3, 3, 3).

% fact name     X  Y  Z Val
matrix(matrix1, 1, 1, 1, 1).


verifyIndex(I, IMax) :-
  is_of_type(positive_integer, I),
  is_of_type(positive_integer, IMax),
  I =< IMax.  

matrixVal(Name, X,    Y,    Z, Val) :-
  matrix( Name, X,    Y,    Z, Val),
  matrix( Name, Xmax, Ymax, Zmax),
  verifyIndex(X, Xmax),
  verifyIndex(Y, Ymax),
  verifyIndex(Z, Zmax).

matrixIsCubic(Matrix1) :-
  matrix(Matrix1, X, Y, Z),
  X == Y, Y == Z.

:-
  matrixVal(matrix1, 1, 1, 1, Val), writeln('val at (1, 1, 1)' = Val),
  write('is 3x3x3 matrix cubic? - '), (matrixIsCubic(matrix1), writeln(true)) ; writeln(false).
