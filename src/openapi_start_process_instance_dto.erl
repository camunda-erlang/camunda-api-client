-module(openapi_start_process_instance_dto).

-export([encode/1]).

-export_type([openapi_start_process_instance_dto/0]).

-type openapi_start_process_instance_dto() ::
    #{ 'businessKey' => binary(),
       'variables' => maps:map(),
       'caseInstanceId' => binary(),
       'startInstructions' => list(),
       'skipCustomListeners' => boolean(),
       'skipIoMappings' => boolean(),
       'withVariablesInReturn' => boolean()
     }.

encode(#{ 'businessKey' := BusinessKey,
          'variables' := Variables,
          'caseInstanceId' := CaseInstanceId,
          'startInstructions' := StartInstructions,
          'skipCustomListeners' := SkipCustomListeners,
          'skipIoMappings' := SkipIoMappings,
          'withVariablesInReturn' := WithVariablesInReturn
        }) ->
    #{ 'businessKey' => BusinessKey,
       'variables' => Variables,
       'caseInstanceId' => CaseInstanceId,
       'startInstructions' => StartInstructions,
       'skipCustomListeners' => SkipCustomListeners,
       'skipIoMappings' => SkipIoMappings,
       'withVariablesInReturn' => WithVariablesInReturn
     }.
