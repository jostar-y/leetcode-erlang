%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1
%%% name: Two Sum
%%% describe: 两数之和
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/two-sum
%%% solution_url: https://leetcode-cn.com/problems/two-sum/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1).

%% API
-export([
    two_sum/2
]).

-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    two_sum(Nums, 0, 1, Target).

two_sum([], _, _, _) ->
    no_result;
two_sum([H | T], M, N, Target) ->
    case two_sum_(H, T, N, Target) of
        {true, N1} -> [M, N1];
        _ -> two_sum(T, M + 1, N + 1, Target)
    end.

two_sum_(_, [], _, _) ->
    false;
two_sum_(P, [H | _T], N, Target) when P + H =:= Target ->
    {true, N};
two_sum_(P, [_H | T], N, Target) ->
    two_sum_(P, T, N + 1, Target).