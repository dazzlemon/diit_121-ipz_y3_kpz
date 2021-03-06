:- ensure_loaded('args_for_table_manip.pl').
:- ensure_loaded('predicate_arglist_to_term.pl').

insert :- 
    writeln('--- INSERTING ---'),
    writeln('What do you want to insert?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    argsForTableManip(Nm, Predicate, _, _, Prompts),
    insert(Predicate, Prompts).

insert(Predicate, ArgNameList) :-
    length(ArgNameList, N),
    length(ArgList, N),% list of empty vars
    pairs_keys_values(ArgPairs, ArgNameList, ArgList),% list of name-empty var pairs
    maplist([X-Y]>>(writef('Input %w: ', [X]), read(Y)), ArgPairs),% read to free vars
    findFreeId(Predicate, N, ID),
    append([ID], ArgList, ArgList_),
    predicateArgListToTerm(Predicate, ArgList_, Term),
    assertz(Term),
    updateDb.

naturalNum(1).
naturalNum(N) :-
    naturalNum(N_),
    N is N_ + 1.

% ArgSize doesn't count ID, ID is first arg
findFreeId(Predicate, ArgSize, ID) :-
    naturalNum(ID),
    length(ArgList, ArgSize),
    append([ID], ArgList, ArgList_),
    not(apply(Predicate, ArgList_)), !.