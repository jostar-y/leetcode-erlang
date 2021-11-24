%%%-------------------------------------------------------------------
%%% @doc
%%% index: 667
%%% name: Beautiful Arrangement II
%%% describe: 优美的排列 II
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/beautiful-arrangement-ii
%%% solution_url: https://leetcode-cn.com/problems/beautiful-arrangement-ii/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_667).

%% API
-export([
    construct_array/2
]).

-spec construct_array(N :: integer(), K :: integer()) -> [integer()].
construct_array(N, K) ->
    List = construct_array(1, N - K, []),
    construct_array(N - K, N, N - K, N, 0, List).

construct_array(I, N, Acc) when I < N ->
    construct_array(I + 1, N, [I | Acc]);
construct_array(_I, _N, Acc) ->
    Acc.

construct_array(I, N, Left, Right, J, Acc) when I =< N ->
    case J rem 2 of
        0 ->
            construct_array(I + 1, N, Left + 1, Right, J + 1, [Left | Acc]);
        _ ->
            construct_array(I + 1, N, Left, Right - 1, J + 1, [Right | Acc])
    end;
construct_array(_, _, _, _, _, Acc) ->
    lists:reverse(Acc).