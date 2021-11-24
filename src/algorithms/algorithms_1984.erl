%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1984
%%% name: Minimum Difference Between Highest And Lowest Of K Scores
%%% describe: 学生分数的最小差值
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
%%% solution_url: https://leetcode-cn.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/solution/
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1984).

%% API
-export([
    minimum_difference/2
]).

-spec minimum_difference(Nums :: [integer()], K :: integer()) -> integer().
minimum_difference(_, 1) -> 0;
minimum_difference(Nums, K) ->
    NNums = lists:sort(Nums),
    KNums = lists:nthtail(K - 1, NNums),
    minimum_difference(NNums, KNums, nil).

minimum_difference(_, [], V) ->
    V;
minimum_difference([H | T1], [K | T2], nil) ->
    minimum_difference(T1, T2, K - H);
minimum_difference([H | T1], [K | T2], V) ->
    minimum_difference(T1, T2, min(K - H, V)).