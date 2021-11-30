%%%-------------------------------------------------------------------
%%% @doc
%%% index: 25
%%% name: Reverse Nodes in k-Group
%%% describe: K 个一组翻转链表
%%% difficulty: 困难
%%% url: https://leetcode-cn.com/problems/reverse-nodes-in-k-group
%%% solution_url: https://leetcode-cn.com/problems/reverse-nodes-in-k-group/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_25).

%% API
-export([
    reverse_k_group/2
]).

%% Definition for singly-linked list.
%%
-record(list_node, {val = 0 :: integer(),
    next = null :: 'null' | #list_node{}}).

-spec reverse_k_group(Head :: #list_node{} | null, K :: integer()) -> #list_node{} | null.
reverse_k_group(Head, K) ->
    reverse_k_group(Head, 0, K, [], []).

reverse_k_group(Head, K, K, TL, Acc) ->
    reverse_k_group(Head, 0, K, [], merge(TL, Acc));
reverse_k_group(null, _I, _K, TL, Acc) ->
    convert(TL ++ Acc);
reverse_k_group(#list_node{val = Val, next = Node}, I, K, TL, Acc) ->
    reverse_k_group(Node, I + 1, K, [Val | TL], Acc).

merge([], Acc) -> Acc;
merge([H | T], Acc) -> merge(T, [H | Acc]).

convert([H | T]) -> convert(T, #list_node{val = H}).
convert([], Node) -> Node;
convert([H | T], Node) -> convert(T, #list_node{val = H, next = Node}).