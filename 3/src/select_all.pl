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
selectAll('1') :-% list all universities
    % writef(' %r\n', ['-', 108]),
    % writeHeader(
    %     ['ID', 'Name', 'President', 'VP'],
    %     [   5,     20,          40,   40]),
    % university(ID, Name, President, VP),
    % writeSeparator([5, 20, 40, 40]),
    % writef('|%5C|%20C|%40C|%40C|\n', [ID, Name, President, VP]),
    % fail; writef(' %r\n', ['-', 108]).
    selectAll(
        university,
        [ ID,   Name,   President,   VP],
        ['ID', 'Name', 'President', 'VP'],
        [   5,     20,          40,   40]).
selectAll('2') :-% list all faculties
    writef(' %r\n', ['-', 42]),
    writeRow(
        ['ID', 'UniversityID', 'Name'],
        [   5,             15,     20]),
    faculty(ID, UniversityID, Name),
    writeSeparator([5, 15, 20]),
    writef('|%5C|%15C|%20C|\n', [ID, UniversityID, Name]),
    fail; writef(' %r\n', ['-', 42]).
selectAll('3') :-% list all departments
    true.% TODO
selectAll('4') :-%list all labs
    true.% TODO

selectAll(Predicate, PredicateArgList, ColumnNameList, ColumnSizeList) :-
    sumList(ColumnSizeList, TotalWidth_),
    length(ColumnSizeList, NColumns), 
    TotalWidth is TotalWidth_ + NColumns - 1,% first char is space
    writef(' %r\n', ['-', TotalWidth]),
    writeRow(ColumnNameList, ColumnSizeList),
    apply(Predicate, PredicateArgList),
    writeSeparator(ColumnSizeList),
    writeRow(PredicateArgList, ColumnSizeList),
    fail; writef(' %r\n', ['-', TotalWidth]).

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