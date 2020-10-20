-module(openapi_signal_dto).

-export([encode/1]).

-export_type([openapi_signal_dto/0]).

-type openapi_signal_dto() ::
    #{ 'name' => binary(),
       'executionId' => binary(),
       'variables' => maps:map(),
       'tenantId' => binary(),
       'withoutTenantId' => boolean()
     }.

encode(#{ 'name' := Name,
          'executionId' := ExecutionId,
          'variables' := Variables,
          'tenantId' := TenantId,
          'withoutTenantId' := WithoutTenantId
        }) ->
    #{ 'name' => Name,
       'executionId' => ExecutionId,
       'variables' => Variables,
       'tenantId' => TenantId,
       'withoutTenantId' => WithoutTenantId
     }.
