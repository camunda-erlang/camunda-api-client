-module(openapi_delete_process_instances_dto).

-export([encode/1]).

-export_type([openapi_delete_process_instances_dto/0]).

-type openapi_delete_process_instances_dto() ::
    #{ 'processInstanceIds' => list(),
       'deleteReason' => binary(),
       'skipCustomListeners' => boolean(),
       'skipSubprocesses' => boolean(),
       'processInstanceQuery' => openapi_process_instance_query_dto:openapi_process_instance_query_dto(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto()
     }.

encode(#{ 'processInstanceIds' := ProcessInstanceIds,
          'deleteReason' := DeleteReason,
          'skipCustomListeners' := SkipCustomListeners,
          'skipSubprocesses' := SkipSubprocesses,
          'processInstanceQuery' := ProcessInstanceQuery,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery
        }) ->
    #{ 'processInstanceIds' => ProcessInstanceIds,
       'deleteReason' => DeleteReason,
       'skipCustomListeners' => SkipCustomListeners,
       'skipSubprocesses' => SkipSubprocesses,
       'processInstanceQuery' => ProcessInstanceQuery,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery
     }.
