-module(openapi_schema_log_query_dto).

-export([encode/1]).

-export_type([openapi_schema_log_query_dto/0]).

-type openapi_schema_log_query_dto() ::
    #{ 'version' => binary(),
       'sorting' => list()
     }.

encode(#{ 'version' := Version,
          'sorting' := Sorting
        }) ->
    #{ 'version' => Version,
       'sorting' => Sorting
     }.
