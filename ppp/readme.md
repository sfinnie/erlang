#Erlang tutorial

##Structure
Created according to the standard erlang [conventions](http://www.erlang.org/doc/design_principles/applications.html#id74089) with [rebar](https://github.com/basho/rebar).  Followed the rebar [getting started](https://github.com/rebar/rebar/wiki/Getting-started) guide on the [wiki](https://github.com/rebar/rebar/wiki).

##Using Dialyzer
Followed the [learn you some erlang](http://learnyousomeerlang.com/dialyzer) instructions.  First built the plt then looked into calling Dialyzer from rebar.  Discovered [this canonical makefile](https://gist.github.com/ericbmerritt/5706091) instead.  Copied it (no changes) and can now compile, run dialyzer, build and test with a simple `make all`. Nice.
