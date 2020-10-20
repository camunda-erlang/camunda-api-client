-module(openapi_external_task_dto).

-export([encode/1]).

-export_type([openapi_external_task_dto/0]).

-type openapi_external_task_dto() ::
    #{ 'activityId' => binary(),
       'activityInstanceId' => binary(),
       'errorMessage' => binary(),
       'executionId' => binary(),
       'id' => binary(),
       'lockExpirationTime' => openapi_date_time:openapi_date_time(),
       'processDefinitionId' => binary(),
       'processDefinitionKey' => binary(),
       'processDefinitionVersionTag' => binary(),
       'processInstanceId' => binary(),
       'tenantId' => binary(),
       'retries' => integer(),
       'suspended' => boolean(),
       'workerId' => binary(),
       'topicName' => binary(),
       'priority' => integer(),
       'businessKey' => binary()
     }.

encode(#{ 'activityId' := ActivityId,
          'activityInstanceId' := ActivityInstanceId,
          'errorMessage' := ErrorMessage,
          'executionId' := ExecutionId,
          'id' := Id,
          'lockExpirationTime' := LockExpirationTime,
          'processDefinitionId' := ProcessDefinitionId,
          'processDefinitionKey' := ProcessDefinitionKey,
          'processDefinitionVersionTag' := ProcessDefinitionVersionTag,
          'processInstanceId' := ProcessInstanceId,
          'tenantId' := TenantId,
          'retries' := Retries,
          'suspended' := Suspended,
          'workerId' := WorkerId,
          'topicName' := TopicName,
          'priority' := Priority,
          'businessKey' := BusinessKey
        }) ->
    #{ 'activityId' => ActivityId,
       'activityInstanceId' => ActivityInstanceId,
       'errorMessage' => ErrorMessage,
       'executionId' => ExecutionId,
       'id' => Id,
       'lockExpirationTime' => LockExpirationTime,
       'processDefinitionId' => ProcessDefinitionId,
       'processDefinitionKey' => ProcessDefinitionKey,
       'processDefinitionVersionTag' => ProcessDefinitionVersionTag,
       'processInstanceId' => ProcessInstanceId,
       'tenantId' => TenantId,
       'retries' => Retries,
       'suspended' => Suspended,
       'workerId' => WorkerId,
       'topicName' => TopicName,
       'priority' => Priority,
       'businessKey' => BusinessKey
     }.
