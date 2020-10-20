-module(openapi_deployment_with_definitions_dto).

-export([encode/1]).

-export_type([openapi_deployment_with_definitions_dto/0]).

-type openapi_deployment_with_definitions_dto() ::
    #{ 'deployedProcessDefinitions' => maps:map(),
       'deployedDecisionDefinitions' => maps:map(),
       'deployedDecisionRequirementsDefinitions' => maps:map(),
       'deployedCaseDefinitions' => maps:map(),
       'id' => binary(),
       'tenantId' => binary(),
       'deploymentTime' => openapi_date_time:openapi_date_time(),
       'source' => binary(),
       'name' => binary(),
       'links' => list()
     }.

encode(#{ 'deployedProcessDefinitions' := DeployedProcessDefinitions,
          'deployedDecisionDefinitions' := DeployedDecisionDefinitions,
          'deployedDecisionRequirementsDefinitions' := DeployedDecisionRequirementsDefinitions,
          'deployedCaseDefinitions' := DeployedCaseDefinitions,
          'id' := Id,
          'tenantId' := TenantId,
          'deploymentTime' := DeploymentTime,
          'source' := Source,
          'name' := Name,
          'links' := Links
        }) ->
    #{ 'deployedProcessDefinitions' => DeployedProcessDefinitions,
       'deployedDecisionDefinitions' => DeployedDecisionDefinitions,
       'deployedDecisionRequirementsDefinitions' => DeployedDecisionRequirementsDefinitions,
       'deployedCaseDefinitions' => DeployedCaseDefinitions,
       'id' => Id,
       'tenantId' => TenantId,
       'deploymentTime' => DeploymentTime,
       'source' => Source,
       'name' => Name,
       'links' => Links
     }.
