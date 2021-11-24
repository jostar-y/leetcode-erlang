%%%-------------------------------------------------------------------
%%% @doc
%%% index: 91
%%% name: Decode Ways
%%% describe: 解码方法
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/decode-ways
%%% solution_url: https://leetcode-cn.com/problems/decode-ways/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_91).

%% API
-export([
    num_decodings/1
]).

-spec num_decodings(S :: unicode:unicode_binary()) -> integer().
num_decodings(<<$0:8, _/binary>>) -> 0;
num_decodings(S) ->
    StrL = string:length(S),
    num_decodings(S, 1, StrL, 0, 1).

num_decodings(S, I, StrL, A, B) when I =< StrL ->
    C = f1(S, I, B),
    C1 = f2(S, I, A, C),
    num_decodings(S, I + 1, StrL, B, C1);
num_decodings(_, _, _, _, C) -> C.

f1(S, I, B) ->
    case binary:at(S, I - 1) of
        $0 -> 0;
        _ -> B
    end.

f2(S, I, A, C) when I > 1 ->
    case binary:at(S, I - 2) of
        $0 -> C;
        SC ->
            N = (SC - $0) * 10 + (binary:at(S, I - 1) - $0),
            case N =< 26 of
                true -> A + C;
                false -> C
            end
    end;
f2(_, _, _, C) -> C.
