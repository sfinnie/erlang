-module(ppp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0, start_link/1]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_link(Tables) ->
    supervisor:start_link(?MODULE, Tables).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

%init([]) ->
%    {ok, { {one_for_one, 5, 10}, []} }.

init(_Tables) ->
    {ok, {{one_for_one, 1, 1}, []}}.
