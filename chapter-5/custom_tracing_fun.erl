-module(custom_tracing_fun).
-export([f/3]).

f(Count, {out, {error, no_frequency}, Pid, _State}, _ProcData) ->
    io:format("*DBG* Warning, Client ~p refused frequency! Count: ~w~n", [Pid, Count]),
    Count + 1;
f(Count, _, _) ->
    Count.