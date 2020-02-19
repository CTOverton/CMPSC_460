% ----------------------------------------
% [ Example 1 ]

sorted([]).
sorted([_]).
sorted([A,B|C]) :-
    A =< B,
    sorted([B|C]).

% ----------------------------------------
% [ Example 2 ]

subsum(Set, Sum, Subset) :-
    subset(Set, Subset),
    sum(Subset, Sum).

sum([],0).
sum([H|T], Sum) :-
    sum(T, Tsum),
    Sum is Tsum+H.

subset([], []).
subset([H|T1], [H|T2]) :-
    subset(T1, T2).
subset([_|T1],T2) :- subset(T1,T2).

% ----------------------------------------
% [ Example 3 ]

shift([X|T],List2) :- append(T,X,Z), flatten(Z,List2).

% ----------------------------------------
% [ Example 4 ]

palindrome(List) :- reverse(List,List).

% ----------------------------------------
% [ Example 5 ]

flat(List, Flatlist) :- flatten(List, Flatlist).

% ----------------------------------------
% [ Example 6 ]

% ----------------------------------------
% [ Example 7 ]

% ----------------------------------------
% [ Example 8 ]
