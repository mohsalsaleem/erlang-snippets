-module(reg_prcs).
-export([ping/1,pong/0, start/0]).

ping(0) ->
	pong ! shuttingdown,
	io:format("Shutting Down ping~n", []);
ping(N) ->
	pong ! {ping, self()},
	receive
		pong ->
			io:format("Pong received~n", [])
	end,
	ping(N - 1).

pong() ->
	receive
		shuttingdown ->
			io:format("Shutting Down pong~n", []);
		{ping, Ping_ID} ->
			io:format("Ping received~n", []),
			Ping_ID ! pong,
			pong()
	end.

start() ->
	register(pong, spawn(reg_prcs, pong, [])),
	spawn(reg_prcs, ping, [3]).
