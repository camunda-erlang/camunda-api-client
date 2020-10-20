-module(openapi_external_task_bpmn_error).

-export([encode/1]).

-export_type([openapi_external_task_bpmn_error/0]).

-type openapi_external_task_bpmn_error() ::
    #{ 'workerId' => binary(),
       'errorCode' => binary(),
       'errorMessage' => binary(),
       'variables' => maps:map()
     }.

encode(#{ 'workerId' := WorkerId,
          'errorCode' := ErrorCode,
          'errorMessage' := ErrorMessage,
          'variables' := Variables
        }) ->
    #{ 'workerId' => WorkerId,
       'errorCode' => ErrorCode,
       'errorMessage' => ErrorMessage,
       'variables' => Variables
     }.
