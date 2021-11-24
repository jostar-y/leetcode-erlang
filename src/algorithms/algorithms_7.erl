%%%-------------------------------------------------------------------
%%% @doc
%%% index: 7
%%% name: Reverse Integer
%%% describe: 整数反转
%%% difficulty: 简单
%%% url: https://leetcode-cn.com/problems/reverse-integer
%%% solution_url: https://leetcode-cn.com/problems/reverse-integer/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_7).

%% API
-export([
    reverse/1
]).

-spec reverse(X :: integer()) -> integer().
reverse(X) when is_integer(X) -> reverse_(reverse(integer_to_list(X)));
reverse([45 | T]) -> list_to_integer([45 | lists:reverse(T)]);
reverse(X) -> list_to_integer(lists:reverse(X)).

reverse_(X) when 2147483646 < X orelse X < -2147483647 -> 0;
reverse_(X) -> X.