-module(openapi_deployment_with_definitions_dto_all_of).

-export([encode/1]).

-export_type([openapi_deployment_with_definitions_dto_all_of/0]).

-type openapi_deployment_with_definitions_dto_all_of() ::
    #{ 'deployedProcessDefinitions' => maps:map(),
       'deployedDecisionDefinitions' => maps:map(),
       'deployedDecisionRequirementsDefinitions' => maps:map(),
       'deployedCaseDefinitions' => maps:map()
     }.

encode(#{ 'deployedProcessDefinitions' := DeployedProcessDefinitions,
          'deployedDecisionDefinitions' := DeployedDecisionDefinitions,
          'deployedDecisionRequirementsDefinitions' := DeployedDecisionRequirementsDefinitions,
          'deployedCaseDefinitions' := DeployedCaseDefinitions
        }) ->
    #{ 'deployedProcessDefinitions' => DeployedProcessDefinitions,
       'deployedDecisionDefinitions' => DeployedDecisionDefinitions,
       'deployedDecisionRequirementsDefinitions' => DeployedDecisionRequirementsDefinitions,
       'deployedCaseDefinitions' => DeployedCaseDefinitions
     }.
