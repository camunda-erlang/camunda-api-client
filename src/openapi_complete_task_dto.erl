-module(openapi_complete_task_dto).

-export([encode/1]).

-export_type([openapi_complete_task_dto/0]).

-type openapi_complete_task_dto() ::
    #{ 'variables' => maps:map(),
       'withVariablesInReturn' => boolean()
     }.

encode(#{ 'variables' := Variables,
          'withVariablesInReturn' := WithVariablesInReturn
        }) ->
    #{ 'variables' => Variables,
       'withVariablesInReturn' => WithVariablesInReturn
     }.
