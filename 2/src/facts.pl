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