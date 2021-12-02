-module(algorithms_1567).

-export([get_max_len/1]).

-spec get_max_len(Nums :: [integer()]) -> integer().
get_max_len(Nums) ->
    get_max_len(Nums, 0, 0, 0, -1, 0).

get_max_len([], _, _, _, _, Max) ->
    Max;
get_max_len([0 | T], I, _Plus, _Minus, _Index, Max) ->
    get_max_len_(T, I, 0, 0, -1, Max);
get_max_len([H | T], I, Plus, Minus, Index, Max) when H > 0 ->
    get_max_len_(T, I, Plus + 1, Minus, Index, Max);
get_max_len([_H | T], I, Plus, Minus, -1, Max) ->
    get_max_len_(T, I, Plus, Minus + 1, I, Max);
get_max_len([_H | T], I, Plus, Minus, Index, Max) ->
    get_max_len_(T, I, Plus, Minus + 1, Index, Max).

get_max_len_(T, I, Plus, Minus, Index, Max) ->
    Max1 =
        case Minus rem 2 of
            0 -> max(Max, Plus + Minus);
            _ -> max(Max, I - Index)
        end,
    get_max_len(T, I + 1, Plus, Minus, Index, Max1).