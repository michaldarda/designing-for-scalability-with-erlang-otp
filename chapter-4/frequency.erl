-module(frequency).
-behavior(gen_server).
-export([start/0, stop/0, allocate/0, deallocate/1]).
-export([init/1, handle_call/3, handle_cast/2, terminate/2, handle_info/2]).

stop() -> gen_server:cast(frequency, stop).
allocate() -> gen_server:call(frequency, {allocate, self()}).
deallocate(Freq) -> gen_server:cast(frequency, {deallocate, Freq}).

start() -> gen_server:start_link({local, frequency}, frequency, [], []).

init(_Args) ->
	Frequencies = {get_frequencies(), []},
    {ok, Frequencies}.

get_frequencies() -> [10,11,12,13,14,15].

handle_call({allocate, Pid}, _From, Frequencies) ->
	{NewFrequencies, Reply} = allocate(Frequencies, Pid),
    {reply, Reply, NewFrequencies}.

handle_cast({deallocate, Freq}, Frequencies) ->
	NewFrequencies = deallocate(Frequencies, Freq),
    {noreply, NewFrequencies};
handle_cast(stop, Frequencies) ->
    {stop, normal, Frequencies}.

handle_info(_Msg, Frequencies) ->
    {noreply, Frequencies}.

terminate(_Reason, _Frequencies) ->
	ok.

allocate({[], Allocated}, _Pid) ->
	{{[], Allocated}, {error, no_frequency}};
allocate({[Freq|Free], Allocated}, Pid) ->
	{{Free, [{Freq, Pid}|Allocated]}, {ok, Freq}}.

deallocate({Free, Allocated}, Freq) ->
	NewAllocated = lists:keydelete(Freq, 1, Allocated),
	{[Freq|Free], NewAllocated}.