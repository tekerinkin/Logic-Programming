implement main
    open core, stdio

class facts - sDB
    s : (integer Value).

class facts
    pos : (integer Number) single.
    neg : (integer Number) single.
    greater : (integer Number) single.
    sum : (integer Sum) single.

class predicates
%    Пусть задан список фактов, содержащий числовые значения, например, s(<num>).
%    - Необходимо определить количество положительных и отрицательных элементов,
%    - количество элементов, превосходящих по модулю заданный
%    - среднее арифметическое положительных элементов
    numOfPos : () nondeterm.
    numOfNeg : () nondeterm.
    numOfGreater : (integer Value) nondeterm.
    abs : (integer Value) -> integer multi.
    sumOfPos : () nondeterm.
    averageOfPos : () nondeterm.

clauses
    pos(0).
    neg(0).
    greater(0).
    sum(0).

clauses
    numOfPos() :-
        s(Val),
        Val > 0,
        pos(Num),
        assert(pos(Num + 1)),
        fail.

    numOfNeg() :-
        s(Val),
        Val < 0,
        neg(Num),
        assert(neg(Num + 1)),
        fail.

    abs(Value) = Abs :-
        Value > 0,
        Abs = Value.

    abs(Value) = Abs :-
        Value < 0,
        Abs = -1 * Value.

    abs(Value) = Value.

    numOfGreater(Value) :-
        s(Num),
        Val = abs(Num),
        Val > Value,
        greater(Cnt),
        assert(greater(Cnt + 1)),
        fail.

    sumOfPos() :-
        s(Val),
        Val > 0,
        sum(Sum),
        assert(sum(Sum + Val)),
        fail.

    averageOfPos() :-
        not(sumOfPos()),
        not(numOfPos()),
        sum(Sum),
        pos(Pos),
        Pos <> 0,
        write(Sum / Pos),
        nl.

clauses
    run() :-
        file::consult("../problem3Data.txt", sDB),
        fail.

    run() :-
        Num = abs(-12),
        write(Num),
        !.

    run().

end implement main

goal
    console::runUtf8(main::run).
