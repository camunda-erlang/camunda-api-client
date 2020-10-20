-module(openapi_process_definition_dto).

-export([encode/1]).

-export_type([openapi_process_definition_dto/0]).

-type openapi_process_definition_dto() ::
    #{ 'id' => binary(),
       'key' => binary(),
       'category' => binary(),
       'description' => binary(),
       'name' => binary(),
       'version' => integer(),
       'resource' => binary(),
       'deploymentId' => binary(),
       'diagram' => binary(),
       'suspended' => boolean(),
       'tenantId' => binary(),
       'versionTag' => binary(),
       'historyTimeToLive' => integer(),
       'startableInTasklist' => boolean()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'category' := Category,
          'description' := Description,
          'name' := Name,
          'version' := Version,
          'resource' := Resource,
          'deploymentId' := DeploymentId,
          'diagram' := Diagram,
          'suspended' := Suspended,
          'tenantId' := TenantId,
          'versionTag' := VersionTag,
          'historyTimeToLive' := HistoryTimeToLive,
          'startableInTasklist' := StartableInTasklist
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'category' => Category,
       'description' => Description,
       'name' => Name,
       'version' => Version,
       'resource' => Resource,
       'deploymentId' => DeploymentId,
       'diagram' => Diagram,
       'suspended' => Suspended,
       'tenantId' => TenantId,
       'versionTag' => VersionTag,
       'historyTimeToLive' => HistoryTimeToLive,
       'startableInTasklist' => StartableInTasklist
     }.
