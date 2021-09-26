:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepatmentID

%             ID, Name
departmentType(1, 'technical').
departmentType(2, 'humanitarian').
departmentType(3, 'special').

university(1, 'DNURT', 'Pshinko Alexander Nikolaevich', 'Bodnar Borys Yevhenovych').
faculty(1, 1, 'TK').
department(1, 1, 1, 'KIT').
lab(1, 1).

readchar(Ch) :-
    get_char(Ch),
    get_char(_).

insert :- 
    writeln('--- INSERTING ---').
    %assert.

delete :-
    writeln('--- DELETING ---').
    %retract

loadDb :-
    consult('db.pl').

selectAll :- 
    %listing(),
    write('press Enter'), get_char(_).

commit :-
    writeln('--- COMMITTING CHANGES TO DATABASE'),
    tell('db.pl'),
    %listing(),
    told.

search :- 
    writeln('Choose something:'),% TODO
    read(Num),
    stud(Nm, Num, _, _),
    writeln(Nm)
    fail; true.

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
% how to add "wrong choice"

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
:-menu.