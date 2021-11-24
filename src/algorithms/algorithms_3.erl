%%%-------------------------------------------------------------------
%%% @length_of_longest_substring_v1c
%%% index: 3
%%% name: Longest Substring Without Repeating Characters
%%% describe: 无重复字符的最长子串
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
%%% solution_url: https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_3).

%% API
-export([
    length_of_longest_substring_v1/1
    , length_of_longest_substring/1
]).

-spec length_of_longest_substring_v1(S :: unicode:unicode_binary()) -> integer().
length_of_longest_substring_v1(S) when is_binary(S) ->
    LS = unicode:characters_to_list(S),
    length_of_longest_substring_v1(LS, 0).

length_of_longest_substring_v1([H | T], MaxLen) ->
    Len = length_of_longest_substring_v1(T, [H], 1),
    length_of_longest_substring_v1(T, max(Len, MaxLen));
length_of_longest_substring_v1([], MaxLen) ->
    MaxLen.

length_of_longest_substring_v1([], _, Len) ->
    Len;
length_of_longest_substring_v1([H | T], Acc, Len) ->
    case lists:member(H, Acc) of
        true -> Len;
        false -> length_of_longest_substring_v1(T, [H | Acc], Len + 1)
    end.

-spec length_of_longest_substring(S :: unicode:unicode_binary()) -> integer().
length_of_longest_substring(S) ->
    length_of_longest_substring(S, #{}, 0, 0, 0).

length_of_longest_substring(<<>>, _, Max, _Start, _I) -> Max;
length_of_longest_substring(<<H:8, S/binary>>, Map, Max, Start, I) ->
    case maps:get(H, Map, -1) of
        P when P >= Start -> length_of_longest_substring(S, Map#{H => I}, Max, P + 1, I + 1);
        _ -> length_of_longest_substring(S, Map#{H => I}, max(Max, I - Start + 1), Start, I + 1)
    end.