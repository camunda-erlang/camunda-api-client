-module(openapi_schema_log_query_dto_sorting).

-export([encode/1]).

-export_type([openapi_schema_log_query_dto_sorting/0]).

-type openapi_schema_log_query_dto_sorting() ::
    #{ 'sortBy' => binary(),
       'sortOrder' => binary()
     }.

encode(#{ 'sortBy' := SortBy,
          'sortOrder' := SortOrder
        }) ->
    #{ 'sortBy' => SortBy,
       'sortOrder' => SortOrder
     }.
