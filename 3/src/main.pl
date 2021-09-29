:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- multifile university/4.
:- multifile faculty/3.
:- multifile department/4.
:- multifile lab/2.

:- ensure_loaded('select_all.pl').
:- ensure_loaded('insert.pl').
:- ensure_loaded('db.pl').

%             ID, Name
departmentType(1, 'technical').
departmentType(2, 'humanitarian').
departmentType(3, 'special').

delete :-
    writeln('--- DELETING ---').
    %retract

search :- 
    writeln('Choose something:').% TODO

clear :-
    %retractall(),
    writeln('--- CLEARED ---').

menuitem(0).
menuitem(1) :- insert.
menuitem(2) :- delete.
menuitem(3) :- selectAll.
menuitem(4) :- search.
menuitem(5) :- clear.
% how to add "wrong choice"(without using if else if ... else)

menu :-
    repeat, nl,
    writeln('1. INSERT'),
    writeln('2. DELETE'),
    writeln('3. SELECT *'),
    writeln('4. Search'),
    writeln('5. Clear database'),
    writeln('0. Exit'),
    writeln('?>'), read(Num), menuitem(Num), Num=0.
:- menu.