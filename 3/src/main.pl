:- ensure_loaded('select_all.pl').
:- ensure_loaded('insert.pl').
:- ensure_loaded('db.pl').
:- ensure_loaded('search.pl').
:- ensure_loaded('args_for_table_manip.pl').

%             ID, Name
departmentType(1, 'technical').
departmentType(2, 'humanitarian').
departmentType(3, 'special').

clear :-% doesn't work properly idk why
    retractall(university(_, _, _, _)),
    retractall(faculty(_, _, _)),
    retractall(department(_, _, _, _)),
    retractall(lab(_, _)),
    updateDb,
    writeln('--- CLEARED ---').

menuitem(0).
menuitem(1) :- insert.
menuitem(2) :- delete.
menuitem(3) :- selectAll.
menuitem(4) :- search_.
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