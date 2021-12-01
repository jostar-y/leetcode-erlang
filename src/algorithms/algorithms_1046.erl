%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1046
%%% name: Last Stone Weight
%%% describe: 最后一块石头的重量
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/last-stone-weight
%%% solution_url: https://leetcode-cn.com/problems/last-stone-weight/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1046).

%% API
-export([
    last_stone_weight/1
]).

-spec last_stone_weight(Stones :: [integer()]) -> integer().
last_stone_weight(Stones) ->
    last_stone_weight_(lists:reverse(lists:sort(Stones))).

last_stone_weight_([]) -> 0;
last_stone_weight_([H]) -> H;
last_stone_weight_([Y, X | T]) ->
    case Y - X of
        0 -> last_stone_weight(T);
        V -> last_stone_weight_(lists:reverse(lists:sort([V | T])))
    end.