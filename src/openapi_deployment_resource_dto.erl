-module(openapi_deployment_resource_dto).

-export([encode/1]).

-export_type([openapi_deployment_resource_dto/0]).

-type openapi_deployment_resource_dto() ::
    #{ 'id' => binary(),
       'name' => binary(),
       'deploymentId' => binary()
     }.

encode(#{ 'id' := Id,
          'name' := Name,
          'deploymentId' := DeploymentId
        }) ->
    #{ 'id' => Id,
       'name' => Name,
       'deploymentId' => DeploymentId
     }.
