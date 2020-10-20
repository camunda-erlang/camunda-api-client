-module(openapi_decision_requirements_definition_dto).

-export([encode/1]).

-export_type([openapi_decision_requirements_definition_dto/0]).

-type openapi_decision_requirements_definition_dto() ::
    #{ 'id' => binary(),
       'key' => binary(),
       'name' => binary(),
       'category' => binary(),
       'version' => integer(),
       'resource' => binary(),
       'deploymentId' => binary(),
       'tenantId' => binary()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'name' := Name,
          'category' := Category,
          'version' := Version,
          'resource' := Resource,
          'deploymentId' := DeploymentId,
          'tenantId' := TenantId
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'name' => Name,
       'category' => Category,
       'version' => Version,
       'resource' => Resource,
       'deploymentId' => DeploymentId,
       'tenantId' => TenantId
     }.
