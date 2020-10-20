-module(openapi_execution_dto).

-export([encode/1]).

-export_type([openapi_execution_dto/0]).

-type openapi_execution_dto() ::
    #{ 'id' => binary(),
       'processInstanceId' => binary(),
       'ended' => boolean(),
       'tenantId' => binary()
     }.

encode(#{ 'id' := Id,
          'processInstanceId' := ProcessInstanceId,
          'ended' := Ended,
          'tenantId' := TenantId
        }) ->
    #{ 'id' => Id,
       'processInstanceId' => ProcessInstanceId,
       'ended' => Ended,
       'tenantId' => TenantId
     }.
