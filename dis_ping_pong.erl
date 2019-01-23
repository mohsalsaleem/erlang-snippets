-module(dis_ping_pong).
-export([start_ping/1, start_pong/0, ping/2, pong/0	]).

ping(0, Pong_Node) -> 
	{pong, Pong_Node} ! finish;
ping(N, Pong_Node) ->
	{pong, Pong_Node} ! {ping, self()},
	receive
		pong ->
			io:format("Pong..~n", [])
	end,		
	ping(N-1, Pong_Node).

pong() ->
	receive
		finish ->
			io:format("Ending..~n", []);
		{ping, Ping_PID} ->
			io:format("Ping..~n", []),
			Ping_PID ! pong,
			pong()
	end.

start_pong() ->
	register(pong, spawn(dis_ping_pong, pong, [])).

start_ping(Pong_Node) ->
	spawn(dis_ping_pong, ping, [5, Pong_Node]).

% erl -sname ping
% erl -sname pong
% c(dis_ping_pong).
% dis_ping_pong:start_pong().
% dis_ping_pong:start_ping(pong@mohsal).
