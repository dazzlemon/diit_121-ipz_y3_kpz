writeStartEndSeparator(ColumnSizeList) :-
    foldl(plus, ColumnSizeList, 0, TotalWidth_),
    length(ColumnSizeList, NColumns), 
    TotalWidth is TotalWidth_ + NColumns - 1,% first char is space
    writef(' %r\n', ['-', TotalWidth]).

% Xs - ColumnValues, Ys - ColumnSizes, len(Xs) = len(Ys)
writeRow(Xs, Ys) :-
    pairs_keys_values(XYs, Xs, Ys),
    maplist(writeCell, XYs), writeln('|').
writeCell(X-Y) :-
    format(atom(Format), '|%~dC', Y),
    writef(Format, [X]).

writeSeparator(Xs) :-
    maplist(writeSep, Xs), writeln('|').
writeSep(X) :-
    writef('|%r', ['-', X]).