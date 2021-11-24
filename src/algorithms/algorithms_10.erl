%%%-------------------------------------------------------------------
%%% @doc
%%% index: 10
%%% name: Regular Expression Matching
%%% describe: 正则表达式匹配
%%% difficulty: 困难
%%% url: https://leetcode-cn.com/problems/regular-expression-matching
%%% solution_url: https://leetcode-cn.com/problems/regular-expression-matching/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_10).

%% API
-export([
    is_match/2
]).

-spec is_match(S :: unicode:unicode_binary(), P :: unicode:unicode_binary()) -> boolean().
is_match(<<>>, <<>>) -> true;
is_match(_, <<>>) -> false;
is_match(S, P) ->
    FMatch = f_match(S, P),
    case P of
        <<_:8, $*:8, PR/binary>> ->
            is_match(S, PR) orelse (FMatch andalso is_match_(S, P));
        _ ->
            FMatch andalso is_match__(S, P)
    end.

f_match(<<>>, _P) -> false;
f_match(<<C:8, _/binary>>, <<C:8, _/binary>>) -> true;
f_match(_, <<$.:8, _/binary>>) -> true;
f_match(_, _) -> false.

is_match_(<<>>, _) -> false;
is_match_(<<_:8, S/binary>>, P) -> is_match(S, P).

is_match__(<<_:8, S/binary>>, <<_:8, P/binary>>) -> is_match(S, P);
is_match__(<<>>, _) -> false.