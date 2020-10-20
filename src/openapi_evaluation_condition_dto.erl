-module(openapi_evaluation_condition_dto).

-export([encode/1]).

-export_type([openapi_evaluation_condition_dto/0]).

-type openapi_evaluation_condition_dto() ::
    #{ 'variables' => maps:map(),
       'businessKey' => binary(),
       'tenantId' => binary(),
       'withoutTenantId' => boolean(),
       'processDefinitionId' => binary()
     }.

encode(#{ 'variables' := Variables,
          'businessKey' := BusinessKey,
          'tenantId' := TenantId,
          'withoutTenantId' := WithoutTenantId,
          'processDefinitionId' := ProcessDefinitionId
        }) ->
    #{ 'variables' => Variables,
       'businessKey' => BusinessKey,
       'tenantId' => TenantId,
       'withoutTenantId' => WithoutTenantId,
       'processDefinitionId' => ProcessDefinitionId
     }.
