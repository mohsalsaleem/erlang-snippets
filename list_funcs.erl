-module(list_funcs).
-export([list_max/1, list_min/1]).

list_max([Head | Rest]) ->
	list_max(Rest, Head).

list_max([], Result) ->
	Result;
list_max([Head | Rest], ResultSoFar) when Head < ResultSoFar ->
	list_max(Rest, ResultSoFar);
list_max([Head | Rest], ResultSoFar) ->
	list_max(Rest, Head).

list_min([Head | Rest]) ->
	list_min(Rest, Head).

list_min([], Result) ->
	Result;
list_min([Head | Rest], ResultSoFar) when Head < ResultSoFar ->
	list_min(Rest, Head);
list_min([Head | Rest], ResultSoFar) ->
	list_min(Rest, ResultSoFar).