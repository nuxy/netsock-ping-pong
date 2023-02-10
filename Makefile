.PHONY: build test clean

build:
	erlc src/netsock_ping_pong.erl

test:
	ct_run -suite test/netsock_ping_pong_SUITE.erl

clean:
	rm -rf all_runs.html ct_default.css ct_log_cache ct_run* index.html jquery* suite* variables-ct* *.beam test/*.beam
