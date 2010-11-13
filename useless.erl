-module(useless).
-author("Matthew J. Morrison").

-export([add/2, hello/0, greet_and_add_two/1, greet/2, head/1, second/1, 
		same/2, valid_time/1, driving_age/1, oh_good/1, help_me/1,
		prepend/2, beach/1]).

add(A,B) ->
	A + B.
	
%% io:format is the standard function used to output text.	
hello() ->
	io:format("Hello, World!~n").
	
greet_and_add_two(X) ->
	hello(),
	add(X,2).

greet(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
	io:format("Hello, ~s!", [Name]).

%% return the first item of a list passed in	
head([H|_]) -> H.

%% return the second item of a list passed in
second([_,X|_]) -> X.

%% return true if both items are the same, otherwise return false

same(X,X) ->
	true;
same(_,_) ->
	false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
	io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
	io:format("Stop feeding me wrong data!~n").
	
driving_age(X) when X >= 16, X =< 70 -> 
	true;
driving_age(_) -> false.

heh_fine() ->
	if 1 =:= 1 ->
		works
	end,
	if 1 =:= 2; 1 =:= 1 ->
		works
	end,
	if 1 =:= 2, 1 =:= 1 ->
		fails
	end.

oh_good(X) ->
	if X =:= 2 -> might_succeed;
		true -> always_does
	end.
	
%% this should be done as a pattern match in function head, but for demo purposes...

help_me(Animal) ->
	Talk = if Animal == cat -> "meow";
			  Animal == beef -> "mooo";
			  Animal == dog -> "bark";
			  Animal == tree -> "bark";
			  true -> "fgdadfgna"
		   end,
	{Animal, "says " ++ Talk ++ "!"}.
	
	
prepend(X, []) ->
	[X];
prepend(X,Set) ->
	case lists:member(X, Set) of
		true -> Set;
		false -> [X|Set]
	end.
	
	
beach(Temp) ->
	case Temp of
		{celsius, N} when N >= 20, N =< 45 ->
			'favorable';
		{kelvin, N} when N >= 293, N =< 318 ->
			'scientifically favorable';
		{fahrenheit, N} when N >= 68, N =< 113 ->
			'favorable in the US';
		_ ->
			'avoid beach'
	end.
	
	