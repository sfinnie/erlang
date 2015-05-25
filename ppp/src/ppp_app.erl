-module(ppp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(normal, []) ->
  io:format("In ppp_app, about to call mnesia:wait_for_tables"),
  mnesia:wait_for_tables([ppp_people, ppp_projects, ppp_roles], 5000),
  ppp_sup:start_link().

stop(_State) ->
    ok.

-ifdef(TEST).

simple_test() ->
  io:format("In ppp_app:simple_test(), about to call application:start()"),
    ok = application:start(ppp),
    ?assertNot(undefined == whereis(ppp_sup)).

-endif.
