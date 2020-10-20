-module(openapi_decision_definition_dto).

-export([encode/1]).

-export_type([openapi_decision_definition_dto/0]).

-type openapi_decision_definition_dto() ::
    #{ 'id' => binary(),
       'key' => binary(),
       'category' => binary(),
       'name' => binary(),
       'version' => integer(),
       'resource' => binary(),
       'deploymentId' => binary(),
       'tenantId' => binary(),
       'decisionRequirementsDefinitionId' => binary(),
       'decisionRequirementsDefinitionKey' => binary(),
       'historyTimeToLive' => integer(),
       'versionTag' => binary()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'category' := Category,
          'name' := Name,
          'version' := Version,
          'resource' := Resource,
          'deploymentId' := DeploymentId,
          'tenantId' := TenantId,
          'decisionRequirementsDefinitionId' := DecisionRequirementsDefinitionId,
          'decisionRequirementsDefinitionKey' := DecisionRequirementsDefinitionKey,
          'historyTimeToLive' := HistoryTimeToLive,
          'versionTag' := VersionTag
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'category' => Category,
       'name' => Name,
       'version' => Version,
       'resource' => Resource,
       'deploymentId' => DeploymentId,
       'tenantId' => TenantId,
       'decisionRequirementsDefinitionId' => DecisionRequirementsDefinitionId,
       'decisionRequirementsDefinitionKey' => DecisionRequirementsDefinitionKey,
       'historyTimeToLive' => HistoryTimeToLive,
       'versionTag' => VersionTag
     }.
