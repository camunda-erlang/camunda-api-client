-module(openapi_process_instance_suspension_state_dto).

-export([encode/1]).

-export_type([openapi_process_instance_suspension_state_dto/0]).

-type openapi_process_instance_suspension_state_dto() ::
    #{ 'suspended' => boolean(),
       'processDefinitionId' => binary(),
       'processDefinitionKey' => binary(),
       'processDefinitionTenantId' => binary(),
       'processDefinitionWithoutTenantId' => boolean(),
       'processInstanceIds' => list(),
       'processInstanceQuery' => openapi_process_instance_query_dto:openapi_process_instance_query_dto(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto()
     }.

encode(#{ 'suspended' := Suspended,
          'processDefinitionId' := ProcessDefinitionId,
          'processDefinitionKey' := ProcessDefinitionKey,
          'processDefinitionTenantId' := ProcessDefinitionTenantId,
          'processDefinitionWithoutTenantId' := ProcessDefinitionWithoutTenantId,
          'processInstanceIds' := ProcessInstanceIds,
          'processInstanceQuery' := ProcessInstanceQuery,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery
        }) ->
    #{ 'suspended' => Suspended,
       'processDefinitionId' => ProcessDefinitionId,
       'processDefinitionKey' => ProcessDefinitionKey,
       'processDefinitionTenantId' => ProcessDefinitionTenantId,
       'processDefinitionWithoutTenantId' => ProcessDefinitionWithoutTenantId,
       'processInstanceIds' => ProcessInstanceIds,
       'processInstanceQuery' => ProcessInstanceQuery,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery
     }.
