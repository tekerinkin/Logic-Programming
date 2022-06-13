person(4, "Maggy", female).
person(3, "Matt", male).


person(1, "Tom", male).
person(2, "Pam", female).

person(5, "Julia", female).
person(6, "Daemon", male).
person(7, "Tony", male).

parent(4, 1).

parent(3, 1).
parent(3, 2).

parent(4, 2).

parent(1, 5).
parent(1, 6).

parent(2, 7).

father(Child, Father) :-
    person(ChildId, Child, _),
    person(FatherId, Father, male),
    parent(ChildId, FatherId).

mother(Child, Mother) :-
    person(ChildId, Child, _),
    person(MotherId, Mother, female),
    parent(ChildId, MotherId).

grandFather(Person, GranFather) :-
    person(PersonId, Person, _),
    parent(PersonId, ParentId),
    person(ParentId, Parent, _),
    father(Parent, GrandFather).

grandMother(Person, GrandMother) :-
    person(PersonId, Person, _),
    parent(PersonId, ParentId),
    person(ParentId, Parent, _),
    mother(Parent, GrandMother).

sister(Person, Sister) :-
    person(_, Sister, female),
    father(Person, Father),
    father(Sister, Father),
    Person <> Sister.

sister(Person, Sister) :-
    person(_, Sister, female),
    mother(Person, Mother),
    mother(Sister, Mother),
    Person <> Sister.
    
brother(Person, Brother) :-
    person(_, Brother, female),
    father(Person, Father),
    father(Brother, Father),
    Person <> Brother.

brother(Person, Brother) :-
    person(_, Brother, female),
    mother(Person, Mother),
    mother(Brother, Mother),
    Person <> Brother.
    
ancestor(Person, Ancestor) :-
    father(Person, Ancestor).

ancestor(Person, Ancestor) :- 
    mother(Person, Ancestor).

ancestor(Person, Ancestor) :-
    father(Person, Father),
    ancestor(Father, Ancestor).

ancestor(Person, Ancestor) :-
    mother(Person, Mother),
    ancestor(Mother, Ancestor).
