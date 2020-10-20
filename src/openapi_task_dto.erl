-module(openapi_task_dto).

-export([encode/1]).

-export_type([openapi_task_dto/0]).

-type openapi_task_dto() ::
    #{ 'id' => binary(),
       'name' => binary(),
       'assignee' => binary(),
       'owner' => binary(),
       'created' => openapi_date_time:openapi_date_time(),
       'due' => openapi_date_time:openapi_date_time(),
       'followUp' => openapi_date_time:openapi_date_time(),
       'delegationState' => binary(),
       'description' => binary(),
       'executionId' => binary(),
       'parentTaskId' => binary(),
       'priority' => integer(),
       'processDefinitionId' => binary(),
       'processInstanceId' => binary(),
       'caseExecutionId' => binary(),
       'caseDefinitionId' => binary(),
       'caseInstanceId' => binary(),
       'taskDefinitionKey' => binary(),
       'suspended' => boolean(),
       'formKey' => binary(),
       'tenantId' => binary()
     }.

encode(#{ 'id' := Id,
          'name' := Name,
          'assignee' := Assignee,
          'owner' := Owner,
          'created' := Created,
          'due' := Due,
          'followUp' := FollowUp,
          'delegationState' := DelegationState,
          'description' := Description,
          'executionId' := ExecutionId,
          'parentTaskId' := ParentTaskId,
          'priority' := Priority,
          'processDefinitionId' := ProcessDefinitionId,
          'processInstanceId' := ProcessInstanceId,
          'caseExecutionId' := CaseExecutionId,
          'caseDefinitionId' := CaseDefinitionId,
          'caseInstanceId' := CaseInstanceId,
          'taskDefinitionKey' := TaskDefinitionKey,
          'suspended' := Suspended,
          'formKey' := FormKey,
          'tenantId' := TenantId
        }) ->
    #{ 'id' => Id,
       'name' => Name,
       'assignee' => Assignee,
       'owner' => Owner,
       'created' => Created,
       'due' => Due,
       'followUp' => FollowUp,
       'delegationState' => DelegationState,
       'description' => Description,
       'executionId' => ExecutionId,
       'parentTaskId' => ParentTaskId,
       'priority' => Priority,
       'processDefinitionId' => ProcessDefinitionId,
       'processInstanceId' => ProcessInstanceId,
       'caseExecutionId' => CaseExecutionId,
       'caseDefinitionId' => CaseDefinitionId,
       'caseInstanceId' => CaseInstanceId,
       'taskDefinitionKey' => TaskDefinitionKey,
       'suspended' => Suspended,
       'formKey' => FormKey,
       'tenantId' => TenantId
     }.
