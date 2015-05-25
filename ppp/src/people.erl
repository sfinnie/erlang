-module(people).
-compile(export_all).
-include("ppp.hrl").

-spec open_db() -> {'ok','people_db'}.
open_db() ->
	File = people_db,
	{ok, people_db} = dets:open_file(File,
																[{keypos, #person.id}, {type, bag}]).

-spec close_db() -> 'ok'.
close_db() ->
	ok = dets:close(people_db).

-spec add_person(person()) -> 'ok'.
add_person(Person) ->
	open_db(),
	ok = dets:insert(people_db, Person),
	close_db().

-spec get_all() -> [tuple()] | {'error',_}.
get_all() ->
	open_db(),
	List = dets:match_object(people_db, '_'),
	close_db(),
	List.
