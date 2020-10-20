-module(openapi_case_definition_dto).

-export([encode/1]).

-export_type([openapi_case_definition_dto/0]).

-type openapi_case_definition_dto() ::
    #{ 'id' => binary(),
       'key' => binary(),
       'category' => binary(),
       'name' => binary(),
       'version' => integer(),
       'resource' => binary(),
       'deploymentId' => binary(),
       'tenantId' => binary(),
       'historyTimeToLive' => integer()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'category' := Category,
          'name' := Name,
          'version' := Version,
          'resource' := Resource,
          'deploymentId' := DeploymentId,
          'tenantId' := TenantId,
          'historyTimeToLive' := HistoryTimeToLive
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'category' => Category,
       'name' => Name,
       'version' => Version,
       'resource' => Resource,
       'deploymentId' => DeploymentId,
       'tenantId' => TenantId,
       'historyTimeToLive' => HistoryTimeToLive
     }.
