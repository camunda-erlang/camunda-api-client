-module(openapi_metrics_result_dto).

-export([encode/1]).

-export_type([openapi_metrics_result_dto/0]).

-type openapi_metrics_result_dto() ::
    #{ 'result' => integer()
     }.

encode(#{ 'result' := Result
        }) ->
    #{ 'result' => Result
     }.
