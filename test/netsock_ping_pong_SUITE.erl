-module(netsock_ping_pong_SUITE).
-export([all/0, load_package/1, check_status/1]).

all() -> [load_package].
  
load_package(_Config) ->
    undefined = whereis(netsock_ping_pong),
    undefined = whereis(netsock_ping_pong_net),
    ok.

check_status(_Config) ->
    ok = netsock_ping_pong_net:check_status("localhost").
