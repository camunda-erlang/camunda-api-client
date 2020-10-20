-module(openapi_process_instance_suspension_state_async_dto).

-export([encode/1]).

-export_type([openapi_process_instance_suspension_state_async_dto/0]).

-type openapi_process_instance_suspension_state_async_dto() ::
    #{ 'suspended' => boolean(),
       'processInstanceIds' => list(),
       'processInstanceQuery' => openapi_process_instance_query_dto:openapi_process_instance_query_dto(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto()
     }.

encode(#{ 'suspended' := Suspended,
          'processInstanceIds' := ProcessInstanceIds,
          'processInstanceQuery' := ProcessInstanceQuery,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery
        }) ->
    #{ 'suspended' => Suspended,
       'processInstanceIds' => ProcessInstanceIds,
       'processInstanceQuery' => ProcessInstanceQuery,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery
     }.
