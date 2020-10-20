-module(openapi_event_subscription_dto).

-export([encode/1]).

-export_type([openapi_event_subscription_dto/0]).

-type openapi_event_subscription_dto() ::
    #{ 'id' => binary(),
       'eventType' => binary(),
       'eventName' => binary(),
       'executionId' => binary(),
       'processInstanceId' => binary(),
       'activityId' => binary(),
       'createdDate' => openapi_date_time:openapi_date_time(),
       'tenantId' => binary()
     }.

encode(#{ 'id' := Id,
          'eventType' := EventType,
          'eventName' := EventName,
          'executionId' := ExecutionId,
          'processInstanceId' := ProcessInstanceId,
          'activityId' := ActivityId,
          'createdDate' := CreatedDate,
          'tenantId' := TenantId
        }) ->
    #{ 'id' => Id,
       'eventType' => EventType,
       'eventName' => EventName,
       'executionId' => ExecutionId,
       'processInstanceId' => ProcessInstanceId,
       'activityId' => ActivityId,
       'createdDate' => CreatedDate,
       'tenantId' => TenantId
     }.
