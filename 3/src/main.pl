:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

%             ID, Name
departmentType(1, 'technical').
departmentType(2, 'humanitarian').
departmentType(3, 'special').

university(1, 'DNURT', 'Pshinko Alexander Nikolaevich', 'Bodnar Borys Yevhenovych').
university(2, 'test', test, test).
faculty(1, 1, 'TK').
department(1, 1, 1, 'KIT').
lab(1, 1).

readchar(Ch) :-
    get_char(Ch),
    get_char(_).

insert :- 
    writeln('--- INSERTING ---'),
    writeln('What do you want to insert?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    readchar(Nm),
    writeln(Nm),
    insert(Nm).


insert('1') :-% insert university
    write('Input UniversityName: '), read(UniversityName),
    write('Input UniversityPresident: '), read(UniversityPresident),
    write('Input UniversityVicePresident: '), read(UniversityVicePresident),
    findFreeUniversityId(ID), assert(university(ID, UniversityName, UniversityPresident, UniversityVicePresident)).
insert('2') :-% insert faculty
    write('Input UniversityID: '), read(UniversityID),
    write('Input Area(of specialization): '), read(Area),
    findFreeFacultyId(ID), assert(faculty(ID, UniversityID, Area)).
insert('3') :-% insert department
    write('Input FacultyID: '), read(FacultyID),
    writeln('Input Type'),
    write('(1 - technical, 2 - humanitarian, 3 - special): '),
    readchar(TypeIdChar), atom_number(TypeIdChar, TypeID),
    write('Input Discipline: '), read(Discipline),
    findFreeDepartmentId(ID), assert(department(ID, FacultyID, TypeID, Discipline)).
insert('4') :-% insert lab
    write('Input DepartmentID: '), read(DepartmentID),
    findFreeLabId(ID), assert(lab(department(ID, DepartmentID))).

findFreeUniversityId(ID) :-
    not(university(ID, _, _, _)).
findFreeFacultyId(ID) :-
    not(faculty(ID, _, _)).
findFreeDepartmentId(ID) :-
    not(department(ID, _, _, _)).
findFreeLabId(ID) :-
    not(lab(ID, _)).

delete :-
    writeln('--- DELETING ---').
    %retract

loadDb :-
    consult('db.pl').

writeUniversitySeparator :-
    writef('|%r|%r|%r|%r|\n', ['-', 5, '-', 20, '-', 40, '-', 40]).
selectAll :-
    %writeUniversitySeparator,
    writef(' %r\n', ['-', 108]),
    writef('|%5C|%20C|%40C|%40C|\n', ['ID', 'Name', 'President', 'VP']),
    %writeUniversitySeparator,
    university(ID, Name, President, VP),
    writeUniversitySeparator,
    writef('|%5C|%20C|%40C|%40C|\n', [ID, Name, President, VP]),
    % writeUniversitySeparator,
    % fail; true.
    fail; writef(' %r\n', ['-', 108]).
    %listing(university),
    %write('press Enter'), get_char(_).

commit :-
    writeln('--- COMMITTING CHANGES TO DATABASE'),
    tell('db.pl'),
    %listing(),
    told.

search :- 
    writeln('Choose something:').% TODO

clear :-
    %retractall(),
    writeln('--- CLEARED ---').

menuitem('0').
menuitem('1') :- insert.
menuitem('2') :- delete.
menuitem('3') :- loadDb.
menuitem('4') :- selectAll.
menuitem('5') :- commit.
menuitem('6') :- search.
menuitem('7') :- clear.
% how to add "wrong choice"(without using if else if ... else)

menu :-
    repeat, nl,
    writeln('1. INSERT'),
    writeln('2. DELETE'),
    writeln('3. Load database'),
    writeln('4. SELECT *'),
    writeln('5. COMMIT'),
    writeln('6. Search'),
    writeln('7. Clear database'),
    writeln('0. Exit'),
    writeln('?>'), readchar(Num), menuitem(Num), Num='0'.
:- menu.