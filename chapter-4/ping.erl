-module(ping).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_info/2]).
-define(TIMEOUT, 5000).


init(_Args) ->
  {ok, undefined, ?TIMEOUT}.

handle_call(_start, _From, State) ->
  {reply, started, State, ?TIMEOUT};
handle_call(pause, _From, State) ->
  {reply, paused, State}.

handle_info(timeout, State) ->
  {_Hour, _Min, Sec} = time(),
  io:format("~2.w~n", [Sec]),
  {noreply, State, ?TIMEOUT}.