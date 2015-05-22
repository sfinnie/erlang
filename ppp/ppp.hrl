-record(person, {id, name, gender}).
-type person() :: #person{}.

-record(role, {id, name, start_date, end_date}).
-type role() :: #role{}.

-record(project, {id, name, start_date, end_date}).
-type project() :: #project{}.
