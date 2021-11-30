%%%-------------------------------------------------------------------
%%% @doc
%%% index: 32
%%% name: Longest Valid Parentheses
%%% describe: 最长有效括号
%%% difficulty: 困难
%%% url: https://leetcode-cn.com/problems/longest-valid-parentheses
%%% solution_url: https://leetcode-cn.com/problems/longest-valid-parentheses/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_32).

%% API
-export([
    longest_valid_parentheses/1
]).

-spec longest_valid_parentheses(S :: unicode:unicode_binary()) -> integer().
longest_valid_parentheses(S) ->
    S1 = binary_to_list(S),
    Max = longest_valid_parentheses_l(S1, 0, 0, 0),
    longest_valid_parentheses_r(lists:reverse(S1), 0, 0, Max).

longest_valid_parentheses_l([], _, _, Max) ->
    Max;
longest_valid_parentheses_l([$) | S], Left, Right, Max) ->
    if
        Right + 1 == Left -> longest_valid_parentheses_l(S, Left, Left, max(Max, Left * 2));
        Right + 1 > Left -> longest_valid_parentheses_l(S, 0, 0, Max);
        true -> longest_valid_parentheses_l(S, Left, Right + 1, Max)
    end;
longest_valid_parentheses_l([$( | S], Left, Right, Max) ->
    longest_valid_parentheses_l(S, Left + 1, Right, Max).

longest_valid_parentheses_r([], _, _, Max) ->
    Max;
longest_valid_parentheses_r([$( | S], Left, Right, Max) ->
    if
        Left + 1 == Right -> longest_valid_parentheses_r(S, Right, Right, max(Max, Right * 2));
        Left + 1 > Right -> longest_valid_parentheses_r(S, 0, 0, Max);
        true -> longest_valid_parentheses_r(S, Left + 1, Right, Max)
    end;
longest_valid_parentheses_r([$) | S], Left, Right, Max) ->
    longest_valid_parentheses_r(S, Left, Right + 1, Max).