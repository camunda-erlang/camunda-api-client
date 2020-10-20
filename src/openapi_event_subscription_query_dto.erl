-module(openapi_event_subscription_query_dto).

-export([encode/1]).

-export_type([openapi_event_subscription_query_dto/0]).

-type openapi_event_subscription_query_dto() ::
    #{ 'eventSubscriptionId' => binary(),
       'eventName' => binary(),
       'eventType' => binary(),
       'executionId' => binary(),
       'processInstanceId' => binary(),
       'activityId' => binary(),
       'tenantIdIn' => list(),
       'withoutTenantId' => boolean(),
       'includeEventSubscriptionsWithoutTenantId' => boolean(),
       'sorting' => list()
     }.

encode(#{ 'eventSubscriptionId' := EventSubscriptionId,
          'eventName' := EventName,
          'eventType' := EventType,
          'executionId' := ExecutionId,
          'processInstanceId' := ProcessInstanceId,
          'activityId' := ActivityId,
          'tenantIdIn' := TenantIdIn,
          'withoutTenantId' := WithoutTenantId,
          'includeEventSubscriptionsWithoutTenantId' := IncludeEventSubscriptionsWithoutTenantId,
          'sorting' := Sorting
        }) ->
    #{ 'eventSubscriptionId' => EventSubscriptionId,
       'eventName' => EventName,
       'eventType' => EventType,
       'executionId' => ExecutionId,
       'processInstanceId' => ProcessInstanceId,
       'activityId' => ActivityId,
       'tenantIdIn' => TenantIdIn,
       'withoutTenantId' => WithoutTenantId,
       'includeEventSubscriptionsWithoutTenantId' => IncludeEventSubscriptionsWithoutTenantId,
       'sorting' => Sorting
     }.
