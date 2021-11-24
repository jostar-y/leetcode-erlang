%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1190
%%% name: Reverse Substrings Between Each Pair Of Parentheses
%%% describe: 反转每对括号间的子串
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/reverse-substrings-between-each-pair-of-parentheses/
%%% solution_url: https://leetcode-cn.com/problems/reverse-substrings-between-each-pair-of-parentheses/solution/
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1190).

%% API
-export([
    reverse_parentheses/1
]).

-spec reverse_parentheses(S :: unicode:unicode_binary()) -> unicode:unicode_binary().
reverse_parentheses(S) ->
    reverse_parentheses(S, 0, #{0 => <<>>}).

reverse_parentheses(<<>>, _, Map) ->
    maps:get(0, Map);
reverse_parentheses(<<$(:8, S/binary>>, I, Map) ->
    reverse_parentheses(S, I + 1, Map#{I + 1 => <<>>});
reverse_parentheses(<<$):8, S/binary>>, I, Map) ->
    V = list_to_binary(string:reverse(maps:get(I, Map))),
    P = maps:get(I - 1, Map),
    NewP = <<P/binary, V/binary>>,
    NewMap = Map#{I => <<>>, I - 1 => NewP},
    reverse_parentheses(S, I - 1, NewMap);
reverse_parentheses(<<C:8, S/binary>>, I, Map) ->
    P = maps:get(I, Map),
    NewP = <<P/binary, C:8>>,
    reverse_parentheses(S, I, Map#{I => NewP}).