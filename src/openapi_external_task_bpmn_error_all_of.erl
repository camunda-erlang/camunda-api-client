-module(openapi_external_task_bpmn_error_all_of).

-export([encode/1]).

-export_type([openapi_external_task_bpmn_error_all_of/0]).

-type openapi_external_task_bpmn_error_all_of() ::
    #{ 'workerId' => binary()
     }.

encode(#{ 'workerId' := WorkerId
        }) ->
    #{ 'workerId' => WorkerId
     }.
