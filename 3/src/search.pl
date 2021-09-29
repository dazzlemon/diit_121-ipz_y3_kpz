:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- multifile university/4.
:- multifile faculty/3.
:- multifile department/4.
:- multifile lab/2.

:- ensure_loaded('table_print.pl').

search_ :-
    writeln('--- SEARCHING ---'),
    writeln('What do you want to search?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    search_(Nm).

search_(1) :- search_(
    university,
    ['ID', 'Name', 'President', 'VP'],
    [   5,     20,          40,   40]).
search_(2) :- search_(
    faculty,
    ['ID', 'UniversityID', 'Name'],
    [   5,             15,     20]).
search_(3) :- search_(
    department,
    ['ID', 'FacultyID', 'TypeID', 'Discipline'],
    [   5,          15,       10,           30]).
search_(4) :- search_(
    lab,
    ['ID', 'DepartmentID'],
    [   5,             15]).

search_(Predicate, ArgNameList, ColumnSizeList) :-
    maplist(question, ArgNameList, Answers),
    maplist(searchFilter, Answers, Args),
    writeStartEndSeparator(ColumnSizeList),
    writeRow(ArgNameList, ColumnSizeList),
    apply(Predicate, Args),
    writeSeparator(ColumnSizeList),
    writeRow(Args, ColumnSizeList),
    fail; writeStartEndSeparator(ColumnSizeList).

question(ArgName, Ans) :-
    writef('Do you want to filter by %w?\n', [ArgName]),
    writeln('If yes input Value to filter by, otherwise input"-":'),
    read(Ans).

searchFilter(Answer, Arg) :-
    Answer = '-' -> true; Arg = Answer. 