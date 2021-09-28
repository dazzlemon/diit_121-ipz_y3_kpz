:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- ensure_loaded('readchar.pl').

selectAll :-
    writeln('--- TABLE LISTING ---'),
    writeln('Which table do you want to see?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    readchar(Nm),
    selectAll(Nm).
selectAll('1') :- selectAll(% list all universities
    university,
    ['ID', 'Name', 'President', 'VP'],
    [   5,     20,          40,   40]).
selectAll('2') :- selectAll(% list all faculties
    faculty,
    ['ID', 'UniversityID', 'Name'],
    [   5,             15,     20]).
selectAll('3') :-% list all departments
    true.% TODO
selectAll('4') :-%list all labs
    true.% TODO

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

sumList([], 0).
sumList([X|Xs], Sum) :-
    sumList(Xs, Sum_),
    Sum is X + Sum_.

writeSeparator([]) :-
    writeln('|').
writeSeparator([X|Xs]) :-
    writef('|%r', ['-', X]),
    writeSeparator(Xs).