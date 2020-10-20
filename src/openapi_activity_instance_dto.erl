-module(openapi_activity_instance_dto).

-export([encode/1]).

-export_type([openapi_activity_instance_dto/0]).

-type openapi_activity_instance_dto() ::
    #{ 'id' => binary(),
       'parentActivityInstanceId' => binary(),
       'activityId' => binary(),
       'activityName' => binary(),
       'activityType' => binary(),
       'processInstanceId' => binary(),
       'processDefinitionId' => binary(),
       'childActivityInstances' => list(),
       'childTransitionInstances' => list(),
       'executionIds' => list(),
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
          'childActivityInstances' := ChildActivityInstances,
          'childTransitionInstances' := ChildTransitionInstances,
          'executionIds' := ExecutionIds,
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
       'childActivityInstances' => ChildActivityInstances,
       'childTransitionInstances' => ChildTransitionInstances,
       'executionIds' => ExecutionIds,
       'incidentIds' => IncidentIds,
       'incidents' => Incidents
     }.
