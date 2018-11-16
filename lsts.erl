-module(lsts).
-export([get_fuel_prices/0, list_length/1]).

get_fuel_prices() ->
	[ { chennai, 80.3 }, { delhi, 85.3 }, { mumbai, 82.09 } ].

list_length([]) -> 
	0;
list_length([ First | Rest ]) ->
	1 + list_length(Rest).

% .c(lsts).
% lsts:get_fuel_prices().
% [ F , S, T | New ] = lsts:get_fuel_prices().
% F.
% S.
% T.
% New.
% lsts:list_length(lsts:get_fuel_prices()).
