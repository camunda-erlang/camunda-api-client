-module(openapi_process_engine_dto).

-export([encode/1]).

-export_type([openapi_process_engine_dto/0]).

-type openapi_process_engine_dto() ::
    #{ 'name' => binary()
     }.

encode(#{ 'name' := Name
        }) ->
    #{ 'name' => Name
     }.
