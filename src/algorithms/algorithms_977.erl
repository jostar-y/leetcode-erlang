%%%-------------------------------------------------------------------
%%% @doc
%%% index: 977
%%% name: Squares of a Sorted Array
%%% describe: 有序数组的平方
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/squares-of-a-sorted-array
%%% solution_url: https://leetcode-cn.com/problems/squares-of-a-sorted-array/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_977).

%% API
-export([
    sorted_squares/1
]).

-spec sorted_squares(Nums :: [integer()]) -> [integer()].
sorted_squares(Nums) ->
    lists:sort([abs(N) * abs(N) || N <- Nums]).