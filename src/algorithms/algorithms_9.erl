%%%-------------------------------------------------------------------
%%% @doc
%%% index: 9
%%% name: Palindrome Number
%%% describe: 回文数
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/palindrome-number
%%% solution_url: https://leetcode-cn.com/problems/palindrome-number/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_9).

%% API
-export([
    is_palindrome/1
]).

-spec is_palindrome(X :: integer()) -> boolean().
is_palindrome(X) when X < 0 -> false;
is_palindrome(0) -> true;
is_palindrome(X) when is_integer(X) ->
    S = integer_to_list(X),
    lists:reverse(S) == S;
is_palindrome(_) -> false.