-module(openapi_deployment_dto).

-export([encode/1]).

-export_type([openapi_deployment_dto/0]).

-type openapi_deployment_dto() ::
    #{ 'id' => binary(),
       'tenantId' => binary(),
       'deploymentTime' => openapi_date_time:openapi_date_time(),
       'source' => binary(),
       'name' => binary(),
       'links' => list()
     }.

encode(#{ 'id' := Id,
          'tenantId' := TenantId,
          'deploymentTime' := DeploymentTime,
          'source' := Source,
          'name' := Name,
          'links' := Links
        }) ->
    #{ 'id' => Id,
       'tenantId' => TenantId,
       'deploymentTime' => DeploymentTime,
       'source' => Source,
       'name' => Name,
       'links' => Links
     }.
