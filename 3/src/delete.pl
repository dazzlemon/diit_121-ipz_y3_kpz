:- ensure_loaded('args_for_table_manip.pl').
:- ensure_loaded('predicate_arglist_to_term.pl').

delete :-
    writeln('--- DELETE ---'),
    writeln('What do you want to delete?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    argsForTableManip(Nm, Predicate, ColumnNames, _, _),
    delete(Predicate, ColumnNames).

delete(Predicate, ArgNameList) :-
    maplist(question, ArgNameList, Answers),
    maplist(searchFilter, Answers, Args),
    predicateArgListToTerm(Predicate, Args, Term),
    retractall(Term),
    updateDb.