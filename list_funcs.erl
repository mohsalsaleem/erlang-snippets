-module(list_funcs).
-export([list_max/1, list_min/1, reverse_list/1, mul_by/2]).

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

reverse_list(List) ->
	reverse_list(List, []).

reverse_list([Head | Rest], Reversed) ->
	reverse_list(Rest, [ Head | Reversed ]);
reverse_list([], Reversed) ->
	Reversed.

mul_by(List, N) ->
	list_mul_by(List, N).

list_mul_by([Head | Rest], MulBy) ->
	Multiplied = Head * MulBy,
	[Multiplied | list_mul_by(Rest, MulBy)];
list_mul_by([], MulBy) ->
	[].
