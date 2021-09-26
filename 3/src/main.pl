readchar(Ch) :-
    get_char(Ch),
    get_char(_).

menuitem('0').
menuitem('1') :-
    writeln('--- INSERTING ---').
    %assert.
menuitem('2') :-
    writeln('--- DELETING ---').
    %retract
menuitem('3') :-
    consult('db.pl').
menuitem('4') :-
    %listing(),
    write('press Enter'), get_char(_).
menuitem('5') :-
    writeln('--- COMMITTING CHANGES TO DATABASE'),
    tell('db.pl'),
    %listing(),
    told.
menuitem('6') :-
    writeln('Choose something:'),% TODO
    read(Num),
    stud(Nm, Num, _, _),
    writeln(Nm)
    fail; true.
menuitem('7') :-
    %retractall(),
    writeln('--- CLEARED ---').
menuitem(X) :- writeln('You chose'=X).

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