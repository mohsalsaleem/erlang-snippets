-module(pingpong).
-export([ping/2,pong/0, start/0]).

ping(0, Pong_ID) ->
	Pong_ID ! shuttingdown,
	io:format("Shutting Down ping~n", []);
ping(N, Pong_ID) ->
	Pong_ID ! {ping, self()},
	receive
		pong ->
			io:format("Pong received~n", [])
	end,
	ping(N - 1, Pong_ID).

pong() ->
	receive
		{ping, Ping_ID} ->
			io:format("Ping received~n", []),
			Ping_ID ! pong,
			pong();
		shuttingdown ->
			io:format("Shutting Down pong~n", [])
	end.

start() ->
	PID = spawn(pingpong, pong, []),
	spawn(pingpong, ping, [3, PID]).
