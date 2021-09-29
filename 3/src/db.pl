:- dynamic university/4.
:- multifile university/4.

:- assertz(university(1, 'DNURT', 'Pshinko Alexander Nikolaevich', 'Bodnar Borys Yevhenovych')).
:- assertz(university(2, test, test, test)).

:- dynamic faculty/3.
:- multifile faculty/3.

:- assertz(faculty(1, 1, 'TK')).

:- dynamic department/4.
:- multifile department/4.

:- assertz(department(1, 1, 1, 'KIT')).

:- dynamic lab/2.
:- multifile lab/2.

:- assertz(lab(1, 1)).

