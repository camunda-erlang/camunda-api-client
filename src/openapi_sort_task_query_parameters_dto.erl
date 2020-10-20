-module(openapi_sort_task_query_parameters_dto).

-export([encode/1]).

-export_type([openapi_sort_task_query_parameters_dto/0]).

-type openapi_sort_task_query_parameters_dto() ::
    #{ 'variable' => binary(),
       'type' => binary()
     }.

encode(#{ 'variable' := Variable,
          'type' := Type
        }) ->
    #{ 'variable' => Variable,
       'type' => Type
     }.
