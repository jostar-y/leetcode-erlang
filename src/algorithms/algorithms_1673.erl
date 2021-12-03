-module(algorithms_1673).

-export([most_competitive/2]).

-spec most_competitive(Nums :: [integer()], K :: integer()) -> [integer()].
most_competitive(Nums, K) ->
    Len = length(Nums),
    most_competitive(Nums, K, [], 0, Len).

most_competitive(Nums, K, SubL, SubLen, ResetLen) when SubLen + ResetLen == K ->
    lists:reverse(SubL, Nums);
most_competitive([H | T], K, SubL, SubLen, ResetLen) ->
    {NSubL, NSubLen} = most_competitive_(H, K, SubL, SubLen, ResetLen),
    most_competitive(T, K, NSubL, NSubLen, ResetLen - 1).

most_competitive_(H, _K, [], _SubLen, _ResetLen) ->
    {[H], 1};
most_competitive_(H, K, SubL = [SubH | _SubT], SubLen, _ResetLen) when H >= SubH ->
    case SubLen == K of
        true ->
            {SubL, SubLen};
        false ->
            {[H | SubL], SubLen + 1}
    end;
most_competitive_(H, K, SubL, SubLen, ResetLen) ->
    NSubL = most_competitive__(H, SubL, ResetLen - K + SubLen),
    {NSubL, length(NSubL)}.

most_competitive__(H, [], _) ->
    [H];
most_competitive__(H, [SubH | SubT], ResetLen) when H < SubH andalso ResetLen > 0 ->
    most_competitive__(H, SubT, ResetLen - 1);
most_competitive__(H, SubL, _ResetLen) ->
    [H | SubL].
