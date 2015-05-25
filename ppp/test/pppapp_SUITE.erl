-module(pppapp_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([init_per_suite/1, end_per_suite/1,
         %init_per_testcase/2, end_per_testcase/2,
         all/0]).
%-export([add_service/1, friend_by_name/1, friend_by_expertise/1,
%         friend_with_services/1, accounts/1, enemies/1]).

%all() -> [add_service, friend_by_name, friend_by_expertise,
%          friend_with_services, accounts, enemies].
all() ->[].

init_per_suite(Config) ->
    Priv = ?config(priv_dir, Config),
    application:load(mnesia),
    application:set_env(mnesia, dir, Priv),
    application:load(pppapp),
    ppp_db:init([node()]),
    application:start(mnesia),
    application:start(pppapp),
    Config.

end_per_suite(_Config) ->
    application:stop(mnesia),
    ok.

%init_per_testcase(add_service, Config) ->
%    Config;
%init_per_testcase(accounts, Config) ->
%    ok = mafiapp:add_friend("Consigliere", [], [you], consigliere),
%    Config;
%init_per_testcase(_, Config) ->
%    ok = mafiapp:add_friend("Don Corleone", [], [boss], boss),
%    Config.

%end_per_testcase(_, _Config) ->
%    ok.

%% services can go both way: from a friend to the boss, or
%% from the boss to a friend! A boss friend is required!
%add_service(_Config) ->
%    {error, unknown_friend} = mafiapp:add_service("from name",
%                                                  "to name",
%                                                  {1946,5,23},
%                                                  "a fake service"),
%    ok = mafiapp:add_friend("Don Corleone", [], [boss], boss),
%    ok = mafiapp:add_friend("Alan Parsons",
%                            [{twitter,"@ArtScienceSound"}],
%                            [{born, {1948,12,20}},
%                             musician, 'audio engineer',
%                             producer, "has projects"],
%                            mixing),
%    ok = mafiapp:add_service("Alan Parsons", "Don Corleone",
%                             {1973,3,1},
%                             "Helped release a Pink Floyd album").
%
%friend_by_name(_Config) ->
%    ok = mafiapp:add_friend("Pete Cityshend",
%                            [{phone, "418-542-3000"},
%                             {email, "quadrophonia@example.org"},
%                             {other, "yell real loud"}],
%                            [{born, {1945,5,19}},
%                             musician, popular],
%                            music),
%    {"Pete Cityshend",
%     _Contact, _Info, music,
%     _Services} = mafiapp:friend_by_name("Pete Cityshend"),
%    undefined = mafiapp:friend_by_name(make_ref()).
