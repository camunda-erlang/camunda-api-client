-module(openapi_transition_instance_dto).

-export([encode/1]).

-export_type([openapi_transition_instance_dto/0]).

-type openapi_transition_instance_dto() ::
    #{ 'id' => binary(),
       'parentActivityInstanceId' => binary(),
       'activityId' => binary(),
       'activityName' => binary(),
       'activityType' => binary(),
       'processInstanceId' => binary(),
       'processDefinitionId' => binary(),
       'executionId' => binary(),
       'incidentIds' => list(),
       'incidents' => list()
     }.

encode(#{ 'id' := Id,
          'parentActivityInstanceId' := ParentActivityInstanceId,
          'activityId' := ActivityId,
          'activityName' := ActivityName,
          'activityType' := ActivityType,
          'processInstanceId' := ProcessInstanceId,
          'processDefinitionId' := ProcessDefinitionId,
          'executionId' := ExecutionId,
          'incidentIds' := IncidentIds,
          'incidents' := Incidents
        }) ->
    #{ 'id' => Id,
       'parentActivityInstanceId' => ParentActivityInstanceId,
       'activityId' => ActivityId,
       'activityName' => ActivityName,
       'activityType' => ActivityType,
       'processInstanceId' => ProcessInstanceId,
       'processDefinitionId' => ProcessDefinitionId,
       'executionId' => ExecutionId,
       'incidentIds' => IncidentIds,
       'incidents' => Incidents
     }.
