-module(openapi_deployment_dto_all_of).

-export([encode/1]).

-export_type([openapi_deployment_dto_all_of/0]).

-type openapi_deployment_dto_all_of() ::
    #{ 'id' => binary(),
       'tenantId' => binary(),
       'deploymentTime' => openapi_date_time:openapi_date_time(),
       'source' => binary(),
       'name' => binary()
     }.

encode(#{ 'id' := Id,
          'tenantId' := TenantId,
          'deploymentTime' := DeploymentTime,
          'source' := Source,
          'name' := Name
        }) ->
    #{ 'id' => Id,
       'tenantId' => TenantId,
       'deploymentTime' => DeploymentTime,
       'source' => Source,
       'name' => Name
     }.
