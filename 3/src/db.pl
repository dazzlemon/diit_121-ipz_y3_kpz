:- dynamic university/4.
:- multifile university/4.

university(1, 'DNURT', 'Pshinko Alexander Nikolaevich', 'Bodnar Borys Yevhenovych').
university(2, test, test, test).
university(3, 3, 3, 3).
university(4, 4, 4, 4).
university(5, 5, 5, 5).
university(6, 6, 6, 6).

:- dynamic faculty/3.
:- multifile faculty/3.

faculty(1, 1, 'TK').

:- dynamic department/4.
:- multifile department/4.

department(1, 1, 1, 'KIT').

:- dynamic lab/2.
:- multifile lab/2.

lab(1, 1).

