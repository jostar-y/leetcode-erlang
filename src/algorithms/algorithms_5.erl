%%%-------------------------------------------------------------------
%%% @doc
%%% index: 5
%%% name: Longest Palindromic Substring
%%% describe: 最长回文子串
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/longest-palindromic-substring
%%% solution_url: https://leetcode-cn.com/problems/longest-palindromic-substring/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_5).

%% API
-export([
    longest_palindrome/1
]).

-spec longest_palindrome(S :: unicode:unicode_binary()) -> unicode:unicode_binary().
longest_palindrome(<<_C:8>> = S) -> S;
longest_palindrome(S) ->
    {Pos, Len} = longest_palindrome(S, <<>>, {0, 0}, 0),
    binary:part(S, Pos, Len).

longest_palindrome(<<>>, _, {Pos, Len}, _) ->
    {Pos, Len};
longest_palindrome(<<C:8, S/binary>>, Bin, Max, N) ->
    NBin = <<Bin/binary, C>>,
    I1 = longest_palindrome_(S, NBin, N - 1, 0),
    I2 = longest_palindrome_(S, NBin, N, 0),
    longest_palindrome(S, NBin, get_max(N, I1, I2, Max), N + 1).

longest_palindrome_(<<>>, _, _, I) -> I;
longest_palindrome_(<<C:8, S/binary>>, Bin, N, I) when N >= 0 ->
    case binary:at(Bin, N) of
        C -> longest_palindrome_(S, Bin, N - 1, I + 1);
        _ -> I
    end;
longest_palindrome_(_, _, _, I) -> I.

get_max(_Pos, Len, {MaxPos, MaxLen}) when MaxLen >= Len -> {MaxPos, MaxLen};
get_max(Pos, Len, {_MaxPos, _MaxLen}) -> {Pos, Len}.

get_max(N, I1, I2, Max) when I1 >= I2 -> get_max(N - I1, 2 * I1 + 1, Max);
get_max(N, _I1, 0, Max) -> get_max(N, 1, Max);
get_max(N, _I1, I2, Max) -> get_max(N - I2 + 1, 2 * I2, Max).