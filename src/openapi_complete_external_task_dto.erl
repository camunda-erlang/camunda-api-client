-module(openapi_complete_external_task_dto).

-export([encode/1]).

-export_type([openapi_complete_external_task_dto/0]).

-type openapi_complete_external_task_dto() ::
    #{ 'workerId' => binary(),
       'variables' => maps:map(),
       'localVariables' => maps:map()
     }.

encode(#{ 'workerId' := WorkerId,
          'variables' := Variables,
          'localVariables' := LocalVariables
        }) ->
    #{ 'workerId' => WorkerId,
       'variables' => Variables,
       'localVariables' => LocalVariables
     }.
