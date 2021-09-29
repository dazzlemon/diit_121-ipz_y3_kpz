:- ensure_loaded('table_print.pl').
:- ensure_loaded('args_for_table_manip.pl').

selectAll :-
    writeln('--- TABLE LISTING ---'),
    writeln('Which table do you want to see?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    argsForTableManip(Nm, Predicate, ColumnNames, ColumnSizes, _),
    selectAll(Predicate, ColumnNames, ColumnSizes).

% predicate arity has to be equal to length of both lists
selectAll(Predicate, ColumnNameList, ColumnSizeList) :-
    writeStartEndSeparator(ColumnSizeList),
    writeRow(ColumnNameList, ColumnSizeList),
    length(ColumnNameList, NColumns),
    length(PredicateArgList, NColumns),% Predicate ArgList is now list of free vars
    apply(Predicate, PredicateArgList),
    writeSeparator(ColumnSizeList),
    writeRow(PredicateArgList, ColumnSizeList),
    fail; writeStartEndSeparator(ColumnSizeList).
    % length calculation separate, because when backtracked TotalWidth is free var
