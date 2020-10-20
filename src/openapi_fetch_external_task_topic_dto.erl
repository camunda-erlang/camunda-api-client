-module(openapi_fetch_external_task_topic_dto).

-export([encode/1]).

-export_type([openapi_fetch_external_task_topic_dto/0]).

-type openapi_fetch_external_task_topic_dto() ::
    #{ 'topicName' := binary(),
       'lockDuration' := integer(),
       'variables' => list(),
       'localVariables' => boolean(),
       'businessKey' => binary(),
       'processDefinitionId' => binary(),
       'processDefinitionIdIn' => list(),
       'processDefinitionKey' => binary(),
       'processDefinitionKeyIn' => list(),
       'processDefinitionVersionTag' => binary(),
       'withoutTenantId' => boolean(),
       'tenantIdIn' => list(),
       'processVariables' => maps:map(),
       'deserializeValues' => boolean()
     }.

encode(#{ 'topicName' := TopicName,
          'lockDuration' := LockDuration,
          'variables' := Variables,
          'localVariables' := LocalVariables,
          'businessKey' := BusinessKey,
          'processDefinitionId' := ProcessDefinitionId,
          'processDefinitionIdIn' := ProcessDefinitionIdIn,
          'processDefinitionKey' := ProcessDefinitionKey,
          'processDefinitionKeyIn' := ProcessDefinitionKeyIn,
          'processDefinitionVersionTag' := ProcessDefinitionVersionTag,
          'withoutTenantId' := WithoutTenantId,
          'tenantIdIn' := TenantIdIn,
          'processVariables' := ProcessVariables,
          'deserializeValues' := DeserializeValues
        }) ->
    #{ 'topicName' => TopicName,
       'lockDuration' => LockDuration,
       'variables' => Variables,
       'localVariables' => LocalVariables,
       'businessKey' => BusinessKey,
       'processDefinitionId' => ProcessDefinitionId,
       'processDefinitionIdIn' => ProcessDefinitionIdIn,
       'processDefinitionKey' => ProcessDefinitionKey,
       'processDefinitionKeyIn' => ProcessDefinitionKeyIn,
       'processDefinitionVersionTag' => ProcessDefinitionVersionTag,
       'withoutTenantId' => WithoutTenantId,
       'tenantIdIn' => TenantIdIn,
       'processVariables' => ProcessVariables,
       'deserializeValues' => DeserializeValues
     }.
