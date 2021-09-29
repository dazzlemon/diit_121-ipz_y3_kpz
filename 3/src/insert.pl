:- ensure_loaded('args_for_table_manip.pl').

insert :- 
    writeln('--- INSERTING ---'),
    writeln('What do you want to insert?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    argsForTableManip(Nm, Predicate, _, _, Prompts),
    insert(Predicate, Prompts).

insert(Predicate, ArgNameList) :-
    length(ArgNameList, N),
    length(ArgList, N),
    pairs_keys_values(ArgPairs, ArgNameList, ArgList),
    maplist(readArg, ArgPairs),
    findFreeId(Predicate, N, ID),
    append([ID], ArgList, ArgList_),
    assertzWithArgs(Predicate, ArgList_),
    updateDb.

assertzWithArgs(Predicate, ArgList_) :-
    length(ArgList_, N_),
    N is N_ - 1,
    swritef(Format, '%w(%r%w).', [Predicate, '%w, ', N]),
    swritef(String, Format, ArgList_),
    term_string(Term, String),
    assertz(Term).

updateDb :-
    tell('db.pl'),
    listing(university),
    listing(faculty),
    listing(department),
    listing(lab),
    told.

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

readArg(X-Y) :-
    writef('Input %w: ', [X]), read(Y).