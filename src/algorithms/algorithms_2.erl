%%%-------------------------------------------------------------------
%%% @doc
%%% index: 2
%%% name: Add Two Numbers
%%% describe: 两数相加
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/add-two-numbers
%%% solution_url: https://leetcode-cn.com/problems/add-two-numbers/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_2).

%% API
-export([
    add_two_numbers/2
]).

%% Definition for singly-linked list.
%%
-record(list_node, {val = 0 :: integer(),
    next = null :: 'null' | #list_node{}}).

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
    add_two_numbers(L1, L2, 0, #list_node{}).

add_two_numbers(null, null, 0, Node) ->
    reverse_convert(Node#list_node.next, #list_node{});
add_two_numbers(null, null, 1, Node) ->
    carry_handle(null, null, 1, Node);
add_two_numbers(null, #list_node{val = Val2, next = L2}, Carry, Node) ->
    carry_handle(null, L2, Val2 + Carry, Node);
add_two_numbers(#list_node{val = Val1, next = L1}, null, Carry, Node) ->
    carry_handle(L1, null, Val1 + Carry, Node);
add_two_numbers(#list_node{val = Val1, next = L1}, #list_node{val = Val2, next = L2}, Carry, Node) ->
    carry_handle(L1, L2, Val1 + Val2 + Carry, Node).

carry_handle(L1, L2, N, Node) when N < 10 ->
    add_two_numbers(L1, L2, 0, #list_node{next = Node#list_node{val = N}});
carry_handle(L1, L2, N, Node) ->
    add_two_numbers(L1, L2, 1, #list_node{next = Node#list_node{val = N - 10}}).

reverse_convert(null, Node) ->
    Node#list_node.next;
reverse_convert(#list_node{val = Val, next = Next}, Node) ->
    reverse_convert(Next, #list_node{next = Node#list_node{val = Val}}).