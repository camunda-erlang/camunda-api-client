-module(openapi_task_query_dto_sorting).

-export([encode/1]).

-export_type([openapi_task_query_dto_sorting/0]).

-type openapi_task_query_dto_sorting() ::
    #{ 'sortBy' => binary(),
       'sortOrder' => binary(),
       'parameters' => openapi_sort_task_query_parameters_dto:openapi_sort_task_query_parameters_dto()
     }.

encode(#{ 'sortBy' := SortBy,
          'sortOrder' := SortOrder,
          'parameters' := Parameters
        }) ->
    #{ 'sortBy' => SortBy,
       'sortOrder' => SortOrder,
       'parameters' => Parameters
     }.
