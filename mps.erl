-module(mps).
-export([new_prices/2]).

-define(is_valid(V), (is_float(V) andalso V =< 100.0 andalso V >= 50.0)).

new_prices(Chennai, Banglore) when ?is_valid(Chennai), ?is_valid(Banglore) ->
	#{ chennai => Chennai, banglore => Banglore }.
