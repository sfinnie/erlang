-module(project).
-compile(export_all).
-include("ppp.hrl").

say_hello() ->
  io:format("hello").
