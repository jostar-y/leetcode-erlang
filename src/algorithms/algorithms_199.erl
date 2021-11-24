%%%-------------------------------------------------------------------
%%% @doc
%%% index: 199
%%% name: Binary Tree Right Side View
%%% describe: 二叉树的右视图
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/binary-tree-right-side-view
%%% solution_url: https://leetcode-cn.com/problems/binary-tree-right-side-view/solution
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_199).

%% API
-export([
    right_side_view/1
]).
%% Definition for a binary tree node.
-record(tree_node, {val = 0 :: integer(),
    left = null :: 'null' | #tree_node{},
    right = null :: 'null' | #tree_node{}}).

-spec right_side_view(Root :: #tree_node{} | null) -> [integer()].
right_side_view(null) -> [];
right_side_view(Root) ->
    Pid = self(),
    spawn(fun() -> right_side_view(Pid, 0, Root) end),
    loop([], 0).

loop(Acc, Deep) ->
    receive
        {push, Deep, Val} -> loop([Val | Acc], Deep + 1);
        _ -> loop(Acc, Deep)
    after 1 ->
        lists:reverse(Acc)
    end.

right_side_view(_Pid, _, null) -> skip;
right_side_view(Pid, Deep, #tree_node{val = Val, right = Right, left = Left}) ->
    Pid ! {push, Deep, Val},
    right_side_view(Pid, Deep + 1, Right),
    right_side_view(Pid, Deep + 1, Left).