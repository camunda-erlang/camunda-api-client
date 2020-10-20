-module(openapi_count_result_dto).

-export([encode/1]).

-export_type([openapi_count_result_dto/0]).

-type openapi_count_result_dto() ::
    #{ 'count' => integer()
     }.

encode(#{ 'count' := Count
        }) ->
    #{ 'count' => Count
     }.
