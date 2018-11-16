-module(lsts).
-export([get_fuel_prices/0]).

get_fuel_prices() ->
	[ { chennai, 80.3 }, { delhi, 85.3 }, { mumbai, 82.09 } ].

% .c(lsts).
% lsts:get_fuel_prices().
% [ F , S, T | New ] = lsts:get_fuel_prices().
% F.
% S.
% T.
% New.
