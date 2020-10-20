-module(openapi_metrics_interval_result_dto).

-export([encode/1]).

-export_type([openapi_metrics_interval_result_dto/0]).

-type openapi_metrics_interval_result_dto() ::
    #{ 'timestamp' => openapi_date_time:openapi_date_time(),
       'name' => binary(),
       'reporter' => binary(),
       'value' => integer()
     }.

encode(#{ 'timestamp' := Timestamp,
          'name' := Name,
          'reporter' := Reporter,
          'value' := Value
        }) ->
    #{ 'timestamp' => Timestamp,
       'name' => Name,
       'reporter' => Reporter,
       'value' => Value
     }.
