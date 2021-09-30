predicateArgListToTerm(Predicate, ArgList, Term) :-
    length(ArgList, N_),
    N is N_ - 1,
    swritef(Format, '%w(%r%w).', [Predicate, '%w, ', N]),
    swritef(String, Format, ArgList),
    term_string(Term, String).