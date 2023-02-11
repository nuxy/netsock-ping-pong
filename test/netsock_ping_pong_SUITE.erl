-module(netsock_ping_pong_SUITE).
-export([all/0, load_package/1, online/1]).

all() -> [load_package].
  
load_package(_Config) ->
    undefined = whereis(netsock_ping_pong),
    undefined = whereis(netsock_ping_pong_net),
    ok.

online(_Config) ->
    ok = netsock_ping_pong_net:online("localhost", "30000").
