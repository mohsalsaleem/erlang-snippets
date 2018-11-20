-module(prcs).
-export([say_something/2, start/0]).

say_something(What, N) when N == 0 ->
	done;
say_something(What, N) ->
	io:format("~p~n", [What]),
	say_something(What, N - 1).

start() ->
	spawn(prcs, say_something, ["Hello", 3]),
	spawn(prcs, say_something, ["World", 3]).
