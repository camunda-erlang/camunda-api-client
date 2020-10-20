-module(openapi_process_definition_suspension_state_dto).

-export([encode/1]).

-export_type([openapi_process_definition_suspension_state_dto/0]).

-type openapi_process_definition_suspension_state_dto() ::
    #{ 'suspended' => boolean(),
       'processDefinitionId' => binary(),
       'processDefinitionKey' => binary(),
       'includeProcessInstances' => boolean(),
       'executionDate' => openapi_date_time:openapi_date_time()
     }.

encode(#{ 'suspended' := Suspended,
          'processDefinitionId' := ProcessDefinitionId,
          'processDefinitionKey' := ProcessDefinitionKey,
          'includeProcessInstances' := IncludeProcessInstances,
          'executionDate' := ExecutionDate
        }) ->
    #{ 'suspended' => Suspended,
       'processDefinitionId' => ProcessDefinitionId,
       'processDefinitionKey' => ProcessDefinitionKey,
       'includeProcessInstances' => IncludeProcessInstances,
       'executionDate' => ExecutionDate
     }.
