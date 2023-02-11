-module(netsock_ping_pong).
-export([main/0]).

% Let's get this party started.
main() ->
    netsock_ping_pong_net:client("localhost", 5678, "ping").
