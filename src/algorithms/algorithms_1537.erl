%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1537
%%% name: get-the-maximum-score
%%% describe: 最大得分
%%% difficulty: 困难
%%% url: https://leetcode-cn.com/problems/get-the-maximum-score/
%%% solution_url: https://leetcode-cn.com/problems/get-the-maximum-score/solution/
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1537).

%% API
-export([
    max_sum/2
]).

-spec max_sum(Nums1 :: [integer()], Nums2 :: [integer()]) -> integer().
max_sum(Nums1, Nums2) ->
    max_sum(Nums1, Nums2, 0, 0) rem 1000000007.

max_sum([], Nums2, N1, N2) ->
    max(lists:sum(Nums2) + N2, N1);
max_sum(Nums1, [], N1, N2) ->
    max(lists:sum(Nums1) + N1, N2);
max_sum([H1 | T1], Nums2 = [H2 | _T2], N1, N2) when H1 < H2 ->
    max_sum(T1, Nums2, N1 + H1, N2);
max_sum(Nums1 = [H1 | _T1], [H2 | T2], N1, N2) when H1 > H2 ->
    max_sum(Nums1, T2, N1, N2 + H2);
max_sum([H1 | T1], [H2 | T2], N1, N2) when H1 =:= H2 ->
    N = max(N1, N2) + H1,
    max_sum(T1, T2, N, N).
