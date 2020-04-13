compile:file("chapter-4/timeout.erl").
gen_server:start({local, timeout}, timeout, [], []).
gen_server:call(timeout, {sleep, 1000}).
