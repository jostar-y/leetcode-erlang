%%%-------------------------------------------------------------------
%%% @doc
%%% index: 377
%%% name: Combination Sum IV
%%% describe: 组合总和 Ⅳ
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/combination-sum-iv
%%% solution_url: https://leetcode-cn.com/problems/combination-sum-iv/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_377).

%% API
-export([
    combination_sum4/2
]).

-spec combination_sum4(Nums :: [integer()], Target :: integer()) -> integer().
combination_sum4(Nums, Target) ->
    combination_sum4(Nums, Nums, Target, 1, #{0 => 1}).


combination_sum4(_, _Nums, Target, I, Map) when Target + 1 == I ->
    maps:get(Target, Map, 0);
combination_sum4([], Nums, Target, I, Map) when I =< Target ->
    combination_sum4(Nums, Nums, Target, I + 1, Map);
combination_sum4([H | T], Nums, Target, I, Map) when I =< Target andalso H =< I ->
    N1 = maps:get(I - H, Map, 0),
    N2 = maps:get(I, Map, 0),
    combination_sum4(T, Nums, Target, I, Map#{I => N1 + N2});
combination_sum4([_H | T], Nums, Target, I, Map) when I =< Target ->
    combination_sum4(T, Nums, Target, I, Map).