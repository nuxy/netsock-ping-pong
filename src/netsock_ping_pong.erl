-module(netsock_ping_pong).
-include_inc("socket.hrl").
-export([main/0]).

% Let's get this party started.
main() ->
    socket:client("localhost", 5678, "ping").
