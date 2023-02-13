-module(netsock_ping_pong).
-export([main/0]).
-include("include/netsock_ping_pong.hrl").

% Let's get this party started.
main() ->
    netsock_ping_pong_net:check_status("localhost"),
    netsock_ping_pong_net:client("localhost", ?TCP_PORT_MIN, "ping").
