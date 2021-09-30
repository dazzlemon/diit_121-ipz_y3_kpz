:- ensure_loaded('table_print.pl').
:- ensure_loaded('args_for_table_manip.pl').

search_ :-
    writeln('--- SEARCHING ---'),
    writeln('What do you want to search?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    argsForTableManip(Nm, Predicate, ColumnNames, ColumnSizes, _),
    search_(Predicate, ColumnNames, ColumnSizes).

search_(Predicate, ArgNameList, ColumnSizeList) :-
    maplist(question, ArgNameList, Answers),
    maplist(searchFilter, Answers, Args),
    writeStartEndSeparator(ColumnSizeList),
    writeRow(ArgNameList, ColumnSizeList),
    apply(Predicate, Args),
    writeSeparator(ColumnSizeList),
    writeRow(Args, ColumnSizeList),
    fail; writeStartEndSeparator(ColumnSizeList).