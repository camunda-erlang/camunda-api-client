-module(openapi_locked_external_task_dto).

-export([encode/1]).

-export_type([openapi_locked_external_task_dto/0]).

-type openapi_locked_external_task_dto() ::
    #{ 'activityId' => binary(),
       'activityInstanceId' => binary(),
       'errorMessage' => binary(),
       'errorDetails' => binary(),
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
       'priority' => integer(),
       'topicName' => binary(),
       'businessKey' => binary(),
       'variables' => maps:map()
     }.

encode(#{ 'activityId' := ActivityId,
          'activityInstanceId' := ActivityInstanceId,
          'errorMessage' := ErrorMessage,
          'errorDetails' := ErrorDetails,
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
          'priority' := Priority,
          'topicName' := TopicName,
          'businessKey' := BusinessKey,
          'variables' := Variables
        }) ->
    #{ 'activityId' => ActivityId,
       'activityInstanceId' => ActivityInstanceId,
       'errorMessage' => ErrorMessage,
       'errorDetails' => ErrorDetails,
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
       'priority' => Priority,
       'topicName' => TopicName,
       'businessKey' => BusinessKey,
       'variables' => Variables
     }.
