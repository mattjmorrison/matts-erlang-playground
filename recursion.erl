-module(recursion).

-export([fac/1, len/1, tail_fac/1, tail_len/1, duplicate/2, tail_duplicate/2, 
	reverse/1, tail_reverse/1, sublist/2, tail_sublist/2, zip/2, lenient_zip/2, tail_zip/2]).

fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N-1).


len([]) -> 0;
len([_|T]) -> 1 + len(T).


tail_fac(N) -> tail_fac(N,1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).

tail_len(L) -> tail_len(L, 0).
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).

duplicate(0, _) ->
	[];
duplicate(N, Term) when N > 0 ->
	[Term|duplicate(N-1, Term)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).
tail_duplicate(0, _, List) -> 
	List;
tail_duplicate(N, Term, List) when N > 0 ->
	tail_duplicate(N-1, Term, [Term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(List) -> tail_reverse(List, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) ->
	tail_reverse(T, [H|Acc]).
	
sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T, N-1)].

tail_sublist(L, N) -> tail_sublist(L, N, []).

tail_sublist([], _, Sublist) -> Sublist;
tail_sublist(_, 0, Sublist) -> Sublist;
tail_sublist([H|T], N, Sublist) ->
	tail_sublist(T, N-1, Sublist ++ [H]).
	
	
zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y}|zip(Xs, Ys)].

lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X, Y}|lenient_zip(Xs, Ys)].

tail_zip(X, Y) -> tail_zip(X, Y, []).

tail_zip([], _, List) -> List;
tail_zip(_, [], List) -> List;
tail_zip([X|Xs], [Y|Ys], List) ->
	tail_zip(Xs, Ys, List ++ [{X, Y}]).
