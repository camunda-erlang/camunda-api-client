-module(openapi_correlation_message_dto).

-export([encode/1]).

-export_type([openapi_correlation_message_dto/0]).

-type openapi_correlation_message_dto() ::
    #{ 'messageName' => binary(),
       'businessKey' => binary(),
       'tenantId' => binary(),
       'withoutTenantId' => boolean(),
       'processInstanceId' => binary(),
       'correlationKeys' => maps:map(),
       'localCorrelationKeys' => maps:map(),
       'processVariables' => maps:map(),
       'processVariablesLocal' => maps:map(),
       'all' => boolean(),
       'resultEnabled' => boolean(),
       'variablesInResultEnabled' => boolean()
     }.

encode(#{ 'messageName' := MessageName,
          'businessKey' := BusinessKey,
          'tenantId' := TenantId,
          'withoutTenantId' := WithoutTenantId,
          'processInstanceId' := ProcessInstanceId,
          'correlationKeys' := CorrelationKeys,
          'localCorrelationKeys' := LocalCorrelationKeys,
          'processVariables' := ProcessVariables,
          'processVariablesLocal' := ProcessVariablesLocal,
          'all' := All,
          'resultEnabled' := ResultEnabled,
          'variablesInResultEnabled' := VariablesInResultEnabled
        }) ->
    #{ 'messageName' => MessageName,
       'businessKey' => BusinessKey,
       'tenantId' => TenantId,
       'withoutTenantId' => WithoutTenantId,
       'processInstanceId' => ProcessInstanceId,
       'correlationKeys' => CorrelationKeys,
       'localCorrelationKeys' => LocalCorrelationKeys,
       'processVariables' => ProcessVariables,
       'processVariablesLocal' => ProcessVariablesLocal,
       'all' => All,
       'resultEnabled' => ResultEnabled,
       'variablesInResultEnabled' => VariablesInResultEnabled
     }.
