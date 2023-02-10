-module(socket).
-export([client/3, server/1]).

% Send network client message.
client(Host, Port, Action) ->
    {ok, Sock} = gen_tcp:connect(Host, Port, [binary, {packet, 0}]),
    ok = gen_tcp:send(Sock, Action),
    ok = gen_tcp:close(Sock).

% Start server instance.
server(Port) ->
    {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, {active, false}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
    Bin.

% Handle socket communication.
do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, list_to_binary(Bs)}
    end.
