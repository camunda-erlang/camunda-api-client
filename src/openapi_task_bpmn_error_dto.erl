-module(openapi_task_bpmn_error_dto).

-export([encode/1]).

-export_type([openapi_task_bpmn_error_dto/0]).

-type openapi_task_bpmn_error_dto() ::
    #{ 'errorCode' => binary(),
       'errorMessage' => binary(),
       'variables' => maps:map()
     }.

encode(#{ 'errorCode' := ErrorCode,
          'errorMessage' := ErrorMessage,
          'variables' := Variables
        }) ->
    #{ 'errorCode' => ErrorCode,
       'errorMessage' => ErrorMessage,
       'variables' => Variables
     }.
