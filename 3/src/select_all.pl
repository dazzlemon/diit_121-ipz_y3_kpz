:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

selectAll :-
    writeln('--- TABLE LISTING ---'),
    writeln('Which table do you want to see?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    readchar(Nm),
    selectAll(Nm).
selectAll('1') :-% list all universities
    writef(' %r\n', ['-', 108]),
    writef('|%5C|%20C|%40C|%40C|\n', ['ID', 'Name', 'President', 'VP']),
    university(ID, Name, President, VP),
    writeUniversitySeparator,
    writef('|%5C|%20C|%40C|%40C|\n', [ID, Name, President, VP]),
    fail; writef(' %r\n', ['-', 108]).
selectAll('2') :-% list all faculties
    writef(' %r\n', ['-', 42]),
    writef('|%5C|%15C|%20C|\n', ['ID', 'UniversityID', 'Name']),
    faculty(ID, UniversityID, Name),
    writeFacultySeparator,
    writef('|%5C|%15C|%20C|\n', [ID, UniversityID, Name]),
    fail; writef(' %r\n', ['-', 42]).
selectAll('3') :-% list all departments
    true.% TODO
selectAll('4') :-%list all labs
    true.% TODO

writeUniversitySeparator :-
    writef('|%r|%r|%r|%r|\n', ['-', 5, '-', 20, '-', 40, '-', 40]).
writeFacultySeparator :-
    writef('|%r|%r|%r|\n', ['-', 5, '-', 15, '-', 20]).

readchar(Ch) :-
    get_char(Ch),
    get_char(_).