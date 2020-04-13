c("chapter-4/ping.erl").
gen_server:start({local, ping}, ping, [], []).
gen_server:call(ping, pause).
gen_server:call(ping, start).