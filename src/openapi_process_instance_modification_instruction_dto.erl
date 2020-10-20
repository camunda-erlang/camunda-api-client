-module(openapi_process_instance_modification_instruction_dto).

-export([encode/1]).

-export_type([openapi_process_instance_modification_instruction_dto/0]).

-type openapi_process_instance_modification_instruction_dto() ::
    #{ 'type' := binary(),
       'variables' => openapi_trigger_variable_value_dto:openapi_trigger_variable_value_dto(),
       'activityId' => binary(),
       'transitionId' => binary(),
       'activityInstanceId' => binary(),
       'transitionInstanceId' => binary(),
       'ancestorActivityInstanceId' => binary(),
       'cancelCurrentActiveActivityInstances' => boolean()
     }.

encode(#{ 'type' := Type,
          'variables' := Variables,
          'activityId' := ActivityId,
          'transitionId' := TransitionId,
          'activityInstanceId' := ActivityInstanceId,
          'transitionInstanceId' := TransitionInstanceId,
          'ancestorActivityInstanceId' := AncestorActivityInstanceId,
          'cancelCurrentActiveActivityInstances' := CancelCurrentActiveActivityInstances
        }) ->
    #{ 'type' => Type,
       'variables' => Variables,
       'activityId' => ActivityId,
       'transitionId' => TransitionId,
       'activityInstanceId' => ActivityInstanceId,
       'transitionInstanceId' => TransitionInstanceId,
       'ancestorActivityInstanceId' => AncestorActivityInstanceId,
       'cancelCurrentActiveActivityInstances' => CancelCurrentActiveActivityInstances
     }.
