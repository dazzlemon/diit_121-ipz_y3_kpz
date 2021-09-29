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