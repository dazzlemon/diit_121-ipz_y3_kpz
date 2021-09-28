:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

insert :- 
    writeln('--- INSERTING ---'),
    writeln('What do you want to insert?'),
    write('(1 - university, 2 - faculty, 3 - department, 4 - lab): '),
    read(Nm),
    insert(Nm).

insert(1) :- insert(% insert university
    university,
    ['UniversityName', 'UniversityPresident', 'UniversityVicePresident']).
insert(2) :- insert(% insert faculty
    faculty,
    ['UniversityID', 'Area(of specialization)']).
insert(3) :- insert(% insert department
    department,
    ['FacultyID',
    'Type\n(1 - technical, 2 - humanitarian, 3 - special)',
    'Discipline']).
insert(4) :- insert(% insert lab
    lab, ['DepartmentID']).

insert(Predicate, ArgNameList) :-
    length(ArgNameList, N),
    length(ArgList, N),
    readArgs(ArgNameList, ArgList),
    findFreeId(Predicate, N, ID),
    append([ID], ArgList, ArgList_),
    assertz(apply(Predicate, ArgList_)).

naturalNum(1).
naturalNum(N) :-
    naturalNum(N_),
    N is N_ + 1,
    writeln(N).

findFreeId(university, _, ID) :-
    naturalNum(ID),
    not(university(ID, _, _, _)), !.
%ArgSize doesn't take ID into accout, ID is first arg, only pass var ID
findFreeId(Predicate, ArgSize, ID) :-
    naturalNum(ID),
    length(ArgList, ArgSize),
    append([ID], ArgList, ArgList_),
    not(apply(Predicate, ArgList_)).

% Xs - ArgNameList, Ys- ArgList
readArgs([], []).
readArgs([X|Xs], [Y|Ys]) :-
    writef('Input %w: ', [X]), read(Y),
    readArgs(Xs, Ys).