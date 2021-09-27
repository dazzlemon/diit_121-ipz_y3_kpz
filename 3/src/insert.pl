:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- ensure_loaded('readchar.pl').

insert :- 
    writeln('--- INSERTING ---'),
    writeln('What do you want to insert?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    readchar(Nm),
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