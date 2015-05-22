-module(ppp_db).
-compile(export_all).
-include("ppp.hrl").

init() ->
  mnesia:create_schema(node()),
  application:start(mnesia),
  create_tables(),
  mnesia:stop().

create_tables() ->
  mnesia:create_table(ppp_people,
                        [{attributes, record_info(fields, person)},
                         {index, [#person.id]},
                         {type, set}]),
  mnesia:create_table(ppp_projects,
                       [{attributes, record_info(fields, project)},
                        {index, [#project.id]},
                        {type, bag}]),
  mnesia:create_table(ppp_roles,
                        [{attributes, record_info(fields, role)},
                         {index, [#role.id]},
                         {type, set}]).
