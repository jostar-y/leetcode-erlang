-module(algorithms_2183).

%% API
-export([
    majority_element/1
]).

-spec majority_element(Nums :: [integer()]) -> integer().
majority_element(Nums) ->
    L = length(Nums),
    majority_element(lists:sort(Nums), ceil(L / 2)).

majority_element([H | T], Length) ->
    majority_element(T, H, Length, 1).

majority_element(_, H, Length, Length) ->
    H;
majority_element([H | T], H, Length, N) ->
    majority_element(T, H, Length, N + 1);
majority_element([H | T], _, Length, _) ->
    majority_element(T, H, Length, 1).