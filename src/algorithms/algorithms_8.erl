%%%-------------------------------------------------------------------
%%% @doc
%%% index: 8
%%% name: String to Integer (atoi)
%%% describe: 字符串转换整数 (atoi)
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/string-to-integer-atoi
%%% solution_url: https://leetcode-cn.com/problems/string-to-integer-atoi/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_8).

%% API
-export([
    my_atoi/1
]).

-spec my_atoi(S :: unicode:unicode_binary()) -> integer().
my_atoi(S) ->
    Str = erlang:binary_to_list(S),
    case string:to_integer(string:strip(Str, left)) of
        {error, _} -> 0;
        {Int, _} when Int > 2147483647 -> 2147483647;
        {Int, _} when Int < -2147483647 -> -2147483648;
        {Int, _} -> Int
    end.
