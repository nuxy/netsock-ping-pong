-module(netsock_ping_pong_net).
-export([client/3, server/1, check_status/1, fetch_port/1]).
-include("include/netsock_ping_pong.hrl").

% Send network client message.
client(Hostname, Port, Action) ->
    {ok, Sock} = gen_tcp:connect(Hostname, Port,
        [binary, {packet, 0}, {debug, ?DEBUG}]),
    ok = gen_tcp:send(Sock, Action),
    ok = gen_tcp:close(Sock).

% Start server instance.
server(Port) ->
    {ok, LSock} = gen_tcp:listen(Port,
        [binary, {packet, 0}, {active, false}, {debug, ?DEBUG}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
    Bin.

% Check server is online.
check_status(Host) ->
    case net_adm:ping(Host) of
        pong -> ok;
        pang -> undefined
    end.

% Fetch active TCP port.
fetch_port(Hostname) ->
    Ports = lists:seq(?TCP_PORT_MIN, ?TCP_PORT_MAX),

    lists:foldl(fun(Port, A) ->
        Host = list_to_atom(lists:concat([Hostname, ":", Port])),

        case check_status(Host) of
            ok -> lists:append([A, [Port]]);
            undefined -> ok
        end
    end, [], Ports).

% Handle socket communication.
do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, list_to_binary(Bs)}
    end.
