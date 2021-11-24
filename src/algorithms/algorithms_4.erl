%%%-------------------------------------------------------------------
%%% @doc
%%% index: 4
%%% name: Median of Two Sorted Arrays
%%% describe: 寻找两个有序数组的中位数
%%% difficulty: 困难
%%% url: https://leetcode-cn.com/problems/median-of-two-sorted-arrays
%%% solution_url: https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_4).

%% API
-export([
    find_median_sorted_arrays/2
]).

-spec find_median_sorted_arrays(Nums1 :: [integer()], Nums2 :: [integer()]) -> float().
find_median_sorted_arrays(Nums1, Nums2) ->
    Fun = fun(A, B) -> A < B end,
    Nums = lists:merge(Fun, Nums1, Nums2),
    L = length(Nums),
    Mid = L div 2,
    case L rem 2 of
        1 -> lists:nth(Mid + 1, Nums) / 1;
        0 when L =/= 0 -> (lists:nth(Mid, Nums) + lists:nth(Mid + 1, Nums)) / 2;
        _ -> 0 / 1
    end.