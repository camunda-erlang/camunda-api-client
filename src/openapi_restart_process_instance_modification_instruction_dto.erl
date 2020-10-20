-module(openapi_restart_process_instance_modification_instruction_dto).

-export([encode/1]).

-export_type([openapi_restart_process_instance_modification_instruction_dto/0]).

-type openapi_restart_process_instance_modification_instruction_dto() ::
    #{ 'type' := binary(),
       'activityId' => binary(),
       'transitionId' => binary()
     }.

encode(#{ 'type' := Type,
          'activityId' := ActivityId,
          'transitionId' := TransitionId
        }) ->
    #{ 'type' => Type,
       'activityId' => ActivityId,
       'transitionId' => TransitionId
     }.
