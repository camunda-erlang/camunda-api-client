-module(openapi_restart_process_instance_dto).

-export([encode/1]).

-export_type([openapi_restart_process_instance_dto/0]).

-type openapi_restart_process_instance_dto() ::
    #{ 'processInstanceIds' => list(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto(),
       'skipCustomListeners' => boolean(),
       'skipIoMappings' => boolean(),
       'initialVariables' => boolean(),
       'withoutBusinessKey' => boolean(),
       'instructions' => list()
     }.

encode(#{ 'processInstanceIds' := ProcessInstanceIds,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery,
          'skipCustomListeners' := SkipCustomListeners,
          'skipIoMappings' := SkipIoMappings,
          'initialVariables' := InitialVariables,
          'withoutBusinessKey' := WithoutBusinessKey,
          'instructions' := Instructions
        }) ->
    #{ 'processInstanceIds' => ProcessInstanceIds,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery,
       'skipCustomListeners' => SkipCustomListeners,
       'skipIoMappings' => SkipIoMappings,
       'initialVariables' => InitialVariables,
       'withoutBusinessKey' => WithoutBusinessKey,
       'instructions' => Instructions
     }.
