-module(openapi_historic_process_instance_query_dto).

-export([encode/1]).

-export_type([openapi_historic_process_instance_query_dto/0]).

-type openapi_historic_process_instance_query_dto() ::
    #{ 'processInstanceId' => binary(),
       'processInstanceIds' => list(),
       'processDefinitionId' => binary(),
       'processDefinitionKey' => binary(),
       'processDefinitionKeyIn' => list(),
       'processDefinitionName' => binary(),
       'processDefinitionNameLike' => binary(),
       'processDefinitionKeyNotIn' => list(),
       'processInstanceBusinessKey' => binary(),
       'processInstanceBusinessKeyLike' => binary(),
       'rootProcessInstances' => boolean(),
       'finished' => boolean(),
       'unfinished' => boolean(),
       'withIncidents' => boolean(),
       'withRootIncidents' => boolean(),
       'incidentType' => binary(),
       'incidentStatus' => binary(),
       'incidentMessage' => binary(),
       'incidentMessageLike' => binary(),
       'startedBefore' => openapi_date_time:openapi_date_time(),
       'startedAfter' => openapi_date_time:openapi_date_time(),
       'finishedBefore' => openapi_date_time:openapi_date_time(),
       'finishedAfter' => openapi_date_time:openapi_date_time(),
       'executedActivityAfter' => openapi_date_time:openapi_date_time(),
       'executedActivityBefore' => openapi_date_time:openapi_date_time(),
       'executedJobAfter' => openapi_date_time:openapi_date_time(),
       'executedJobBefore' => openapi_date_time:openapi_date_time(),
       'startedBy' => binary(),
       'superProcessInstanceId' => binary(),
       'subProcessInstanceId' => binary(),
       'superCaseInstanceId' => binary(),
       'subCaseInstanceId' => binary(),
       'caseInstanceId' => binary(),
       'tenantIdIn' => list(),
       'withoutTenantId' => boolean(),
       'executedActivityIdIn' => list(),
       'activeActivityIdIn' => list(),
       'active' => boolean(),
       'suspended' => boolean(),
       'completed' => boolean(),
       'externallyTerminated' => boolean(),
       'internallyTerminated' => boolean(),
       'variables' => list(),
       'variableNamesIgnoreCase' => boolean(),
       'variableValuesIgnoreCase' => boolean(),
       'orQueries' => list(),
       'sorting' => list()
     }.

encode(#{ 'processInstanceId' := ProcessInstanceId,
          'processInstanceIds' := ProcessInstanceIds,
          'processDefinitionId' := ProcessDefinitionId,
          'processDefinitionKey' := ProcessDefinitionKey,
          'processDefinitionKeyIn' := ProcessDefinitionKeyIn,
          'processDefinitionName' := ProcessDefinitionName,
          'processDefinitionNameLike' := ProcessDefinitionNameLike,
          'processDefinitionKeyNotIn' := ProcessDefinitionKeyNotIn,
          'processInstanceBusinessKey' := ProcessInstanceBusinessKey,
          'processInstanceBusinessKeyLike' := ProcessInstanceBusinessKeyLike,
          'rootProcessInstances' := RootProcessInstances,
          'finished' := Finished,
          'unfinished' := Unfinished,
          'withIncidents' := WithIncidents,
          'withRootIncidents' := WithRootIncidents,
          'incidentType' := IncidentType,
          'incidentStatus' := IncidentStatus,
          'incidentMessage' := IncidentMessage,
          'incidentMessageLike' := IncidentMessageLike,
          'startedBefore' := StartedBefore,
          'startedAfter' := StartedAfter,
          'finishedBefore' := FinishedBefore,
          'finishedAfter' := FinishedAfter,
          'executedActivityAfter' := ExecutedActivityAfter,
          'executedActivityBefore' := ExecutedActivityBefore,
          'executedJobAfter' := ExecutedJobAfter,
          'executedJobBefore' := ExecutedJobBefore,
          'startedBy' := StartedBy,
          'superProcessInstanceId' := SuperProcessInstanceId,
          'subProcessInstanceId' := SubProcessInstanceId,
          'superCaseInstanceId' := SuperCaseInstanceId,
          'subCaseInstanceId' := SubCaseInstanceId,
          'caseInstanceId' := CaseInstanceId,
          'tenantIdIn' := TenantIdIn,
          'withoutTenantId' := WithoutTenantId,
          'executedActivityIdIn' := ExecutedActivityIdIn,
          'activeActivityIdIn' := ActiveActivityIdIn,
          'active' := Active,
          'suspended' := Suspended,
          'completed' := Completed,
          'externallyTerminated' := ExternallyTerminated,
          'internallyTerminated' := InternallyTerminated,
          'variables' := Variables,
          'variableNamesIgnoreCase' := VariableNamesIgnoreCase,
          'variableValuesIgnoreCase' := VariableValuesIgnoreCase,
          'orQueries' := OrQueries,
          'sorting' := Sorting
        }) ->
    #{ 'processInstanceId' => ProcessInstanceId,
       'processInstanceIds' => ProcessInstanceIds,
       'processDefinitionId' => ProcessDefinitionId,
       'processDefinitionKey' => ProcessDefinitionKey,
       'processDefinitionKeyIn' => ProcessDefinitionKeyIn,
       'processDefinitionName' => ProcessDefinitionName,
       'processDefinitionNameLike' => ProcessDefinitionNameLike,
       'processDefinitionKeyNotIn' => ProcessDefinitionKeyNotIn,
       'processInstanceBusinessKey' => ProcessInstanceBusinessKey,
       'processInstanceBusinessKeyLike' => ProcessInstanceBusinessKeyLike,
       'rootProcessInstances' => RootProcessInstances,
       'finished' => Finished,
       'unfinished' => Unfinished,
       'withIncidents' => WithIncidents,
       'withRootIncidents' => WithRootIncidents,
       'incidentType' => IncidentType,
       'incidentStatus' => IncidentStatus,
       'incidentMessage' => IncidentMessage,
       'incidentMessageLike' => IncidentMessageLike,
       'startedBefore' => StartedBefore,
       'startedAfter' => StartedAfter,
       'finishedBefore' => FinishedBefore,
       'finishedAfter' => FinishedAfter,
       'executedActivityAfter' => ExecutedActivityAfter,
       'executedActivityBefore' => ExecutedActivityBefore,
       'executedJobAfter' => ExecutedJobAfter,
       'executedJobBefore' => ExecutedJobBefore,
       'startedBy' => StartedBy,
       'superProcessInstanceId' => SuperProcessInstanceId,
       'subProcessInstanceId' => SubProcessInstanceId,
       'superCaseInstanceId' => SuperCaseInstanceId,
       'subCaseInstanceId' => SubCaseInstanceId,
       'caseInstanceId' => CaseInstanceId,
       'tenantIdIn' => TenantIdIn,
       'withoutTenantId' => WithoutTenantId,
       'executedActivityIdIn' => ExecutedActivityIdIn,
       'activeActivityIdIn' => ActiveActivityIdIn,
       'active' => Active,
       'suspended' => Suspended,
       'completed' => Completed,
       'externallyTerminated' => ExternallyTerminated,
       'internallyTerminated' => InternallyTerminated,
       'variables' => Variables,
       'variableNamesIgnoreCase' => VariableNamesIgnoreCase,
       'variableValuesIgnoreCase' => VariableValuesIgnoreCase,
       'orQueries' => OrQueries,
       'sorting' => Sorting
     }.
