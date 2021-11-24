%%%-------------------------------------------------------------------
%%% @doc
%%% index: 6
%%% name: ZigZag Conversion
%%% describe: Z 字形变换
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/zigzag-conversion
%%% solution_url: https://leetcode-cn.com/problems/zigzag-conversion/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_6).

%% API
-export([
    convert/2
    , convert_v1/2
]).

-spec convert(S :: unicode:unicode_binary(), NumRows :: integer()) -> unicode:unicode_binary().
convert(S, 1) -> S;
convert(S, NumRows) ->
    convert(0, S, NumRows, 2 * NumRows - 2, string:length(S), <<>>).

convert(I, S, NumRows, Step, StrLen, Acc) when I < NumRows ->
    Acc1 = convert_(S, I, I, NumRows, StrLen, Step, I * 2, Acc),
    convert(I + 1, S, NumRows, Step, StrLen, Acc1);
convert(_, _, _, _, _, Acc) ->
    Acc.

convert_(S, Index, I, NumRows, StrLen, Step, Add, Acc) when Index < StrLen ->
    Add1 = Step - Add,
    Index1 = index(I, NumRows, Step, Add1) + Index,
    C = binary:at(S, Index),
    convert_(S, Index1, I, NumRows, StrLen, Step, Add1, <<Acc/binary, C>>);
convert_(_, _, _, _, _, _, _, Acc) ->
    Acc.

index(I, NumRows, Step, _Add) when I == 0 orelse I == NumRows - 1 -> Step;
index(_I, _NumRows, _Step, Add) -> Add.

-spec convert_v1(S :: unicode:unicode_binary(), NumRows :: integer()) -> unicode:unicode_binary().
convert_v1(S, 1) -> S;
convert_v1(S, NumRows) ->
    case NumRows > string:length(S) of
        true -> S;
        false -> convert_v1(S, NumRows, 1, add, dict:new())
    end.

convert_v1(<<>>, NumRows, _N, _, D) ->
    convert_v1_(NumRows, 1, D, []);
convert_v1(<<C:8, S/binary>>, NumRows, N, add, D) when N == NumRows ->
    convert_v1(S, NumRows, N - 1, minus, dict:append(N, C, D));
convert_v1(<<C:8, S/binary>>, NumRows, 1, minus, D) ->
    convert_v1(S, NumRows, 2, add, dict:append(1, C, D));
convert_v1(<<C:8, S/binary>>, NumRows, N, add, D) ->
    convert_v1(S, NumRows, N + 1, add, dict:append(N, C, D));
convert_v1(<<C:8, S/binary>>, NumRows, N, minus, D) ->
    convert_v1(S, NumRows, N - 1, minus, dict:append(N, C, D)).

convert_v1_(NumRows, N, D, Acc) when NumRows >= N ->
    convert_v1_(NumRows, N + 1, D, Acc ++ dict:fetch(N, D));
convert_v1_(_, _, _, Acc) ->
    list_to_binary(Acc).