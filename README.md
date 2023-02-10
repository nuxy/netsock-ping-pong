# netsock_ping_pong

Ping Pong(ing) within a network using Erlang/OTP.

The idea is pretty simple.

- First `HOST:PORT` available gets to serve (0 Love).
- When target `HOST:PORT` is not available (1 point).
- When target is available the request is returned.
- If both `HOST1:PORT=HOST2:PORT` (net-cointoss).
- `HOST` changes `PORT` for every action.
- Game play is based on how fast `PORT` is exposed.

## Dependencies

- [Visual Studio Code](https://code.visualstudio.com/download)
- [Docker](https://docs.docker.com/get-docker)

## Launching in Remote-Containers

In the VS Code _Command Palette_ choose "Open Folder in Container" which will launch the server in a Docker container allowing for realtime development and testing.

## Developers

### CLI options

Compile package sources:

    $ make build

Start the program:

```text
Eshell v13.1.4  (abort with ^G)
1> netsock_ping_pong:test().
```

## References

- [gen_tcp - Interface to TCP/IP sockets](https://www.erlang.org/doc/man/gen_tcp.html)
