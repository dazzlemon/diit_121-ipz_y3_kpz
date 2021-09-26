readchar(Ch) :-
    get_char(Ch),
    get_char(_).

menuitem(X) :- writeln('You chose'=X).

menu :-
    repeat, nl,
    writeln('1. INSERT'),
    writeln('2. DELETE'),
    writeln('3. Load table'),
    writeln('5. SELECT *'),
    writeln('6. COMMIT'),
    writeln('7. Save to file'),
    writeln('8. Search'),
    writeln('0. Exit'),
    writeln('?>'), readchar(Num), menuitem(Num), Num='0'.
:-menu.