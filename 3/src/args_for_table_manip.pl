:- dynamic university/4.% ID, Name, President, VicePresident
:- dynamic faculty/3.   % ID, UniversityID, Area(of specialization)
:- dynamic department/4.% ID, FacultyID, TypeID, Discipline
:- dynamic lab/2.       % ID, DepartmentID

:- multifile university/4.
:- multifile faculty/3.
:- multifile department/4.
:- multifile lab/2.

% id, table, columns, columnSizes, prompts
argsForTableManip(
    1, university,
    ['ID', 'Name', 'President', 'VP'],
    [   5,     20,          40,   40],
    ['UniversityName', 'UniversityPresident', 'UniversityVicePresident']).
argsForTableManip(
    2, faculty,
    ['ID', 'UniversityID', 'Name'],
    [   5,             15,     20],
    ['UniversityID', 'Area(of specialization)']).
argsForTableManip(
    3, department,
    ['ID', 'FacultyID', 'TypeID', 'Discipline'],
    [   5,          15,       10,           30],
    ['FacultyID',
    'Type\n(1 - technical, 2 - humanitarian, 3 - special)',
    'Discipline']).
argsForTableManip(
    4, lab,
    ['ID', 'DepartmentID'],
    [   5,             15],
    ['DepartmentID']).