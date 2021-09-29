writeStartEndSeparator(ColumnSizeList) :-
    sumList(ColumnSizeList, TotalWidth_),
    length(ColumnSizeList, NColumns), 
    TotalWidth is TotalWidth_ + NColumns - 1,% first char is space
    writef(' %r\n', ['-', TotalWidth]).

% Xs - ColumnValues, Ys - ColumnSizes, len(Xs) = len(Ys)
writeRow([], []) :-
    writeln('|').
writeRow([X|Xs], [Y|Ys]) :-
    format(atom(Format), '|%~dC', Y),
    writef(Format, [X]),
    writeRow(Xs, Ys).

writeSeparator([]) :-
    writeln('|').
writeSeparator([X|Xs]) :-
    writef('|%r', ['-', X]),
    writeSeparator(Xs).

sumList([], 0).
sumList([X|Xs], Sum) :-
    sumList(Xs, Sum_),
    Sum is X + Sum_.