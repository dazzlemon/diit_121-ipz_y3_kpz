:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- multifile university/4.
:- multifile faculty/3.
:- multifile department/4.
:- multifile lab/2.

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
