.PHONY: build test clean

build:
	erlc src/*

test:
	ct_run -suite test/*

clean:
	rm -rf all_runs.html ct_default.css ct_log_cache ct_run* index.html jquery* suite* variables-ct* *.beam test/*.beam
