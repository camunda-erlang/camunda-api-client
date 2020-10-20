-module(openapi_extend_lock_on_external_task_dto).

-export([encode/1]).

-export_type([openapi_extend_lock_on_external_task_dto/0]).

-type openapi_extend_lock_on_external_task_dto() ::
    #{ 'workerId' => binary(),
       'newDuration' => integer()
     }.

encode(#{ 'workerId' := WorkerId,
          'newDuration' := NewDuration
        }) ->
    #{ 'workerId' => WorkerId,
       'newDuration' => NewDuration
     }.
