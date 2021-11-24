%%%-------------------------------------------------------------------
%%% @doc
%%% index: 1701
%%% name: average-waiting-time
%%% describe: 平均等待时间
%%% difficulty: 中等
%%% url: https://leetcode-cn.com/problems/average-waiting-time/
%%% solution_url: https://leetcode-cn.com/problems/average-waiting-time/solution/
%%% @end
%%%-------------------------------------------------------------------
-module(algorithms_1701).

%% API
-export([
    average_waiting_time/1
]).

-spec average_waiting_time(Customers :: [[integer()]]) -> float().
average_waiting_time(Customers) ->
    average_waiting_time(Customers, 0, 0, []).

average_waiting_time([], _, Num, WaitList) ->
    lists:sum(WaitList) / Num;
average_waiting_time([[Arrival, Time] | T], NTime, Num, WaitList) when Arrival >= NTime ->
    average_waiting_time(T, Arrival + Time, Num + 1, [Time | WaitList]);
average_waiting_time([[Arrival, Time] | T], NTime, Num, WaitList) ->
    Wait = NTime - Arrival + Time,
    average_waiting_time(T, NTime + Time, Num + 1, [Wait | WaitList]).