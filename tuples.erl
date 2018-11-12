-module(tuples).
-export([convert/1]).

convert({ centimeter, X }) ->
	{ inch, X / 2.54 };
convert({ inch, Y }) ->
	{ centimeter, Y * 2.54 }.

% c(tuples).
% tuples:convert({ centimeter, 30.48 })
% {inch,12.0}
% tuples:convert(tuples:convert({ centimeter, 30.48 }))
% {centimeter,30.48}
