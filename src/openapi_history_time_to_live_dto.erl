-module(openapi_history_time_to_live_dto).

-export([encode/1]).

-export_type([openapi_history_time_to_live_dto/0]).

-type openapi_history_time_to_live_dto() ::
    #{ 'historyTimeToLive' => integer()
     }.

encode(#{ 'historyTimeToLive' := HistoryTimeToLive
        }) ->
    #{ 'historyTimeToLive' => HistoryTimeToLive
     }.
