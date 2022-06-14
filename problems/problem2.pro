% Copyright

implement main
    open core, stdio

domains
    category = living; transport; food; other.

class facts - spendingsDB
    spendings : (integer Spendings, category Category, integer Day, string Month).
    counter : (integer Cnt) single.
    sum : (integer Sum) single.

class predicates
%    prints report with total / average spendings per day on this category over the given month
    categoryReport : (category Category, string Month) failure.
%    prints full report with total / average spendings by category (and in general) over the given month
%    you may also implement a report of stats by date on the given month
    fullReport : (category Category, string Month).
    categoryStats : (category Category, string Month) failure.

clauses
    counter(0).
    sum(0).

clauses
    categoryReport(Category, Month) :-
        writef("------------- % -----------", Category),
        nl,
        !,
        spendings(Total, Category, Day, Month),
        writef("Day % : %", Day, Total),
        nl,
        fail.

    categoryStats(Category, Month) :-
        assert(counter(0)),
        assert(sum(0)),
        !,
        spendings(Num, Category, _, Month),
        counter(Cnt),
        sum(Sum),
        assert(counter(Cnt + 1)),
        assert(sum(Sum + Num)),
        fail.

    fullReport(Category, Month) :-
        not(categoryReport(Category, Month)),
        not(categoryStats(Category, Month)),
        counter(Cnt),
        sum(Sum),
        writef("Total: %,  ", Sum),
        Cnt <> 0,
        writef("Average: %\n", Sum / Cnt),
        fail.

    fullReport(_, _) :-
        write("----------------------------------------\n\n").

clauses
    run() :-
        file::consult("../data.txt", spendingsDB),
        fail.

    /*run() :-
        categoryReport(transport, "April"),
        fail.
        */
    run() :-
        fullReport(living, "April"),
        fullReport(transport, "April"),
        fullReport(food, "April"),
        fullReport(other, "April").

end implement main

goal
    console::runUtf8(main::run).
