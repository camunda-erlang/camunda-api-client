-module(openapi_event_subscription_api).

-export([get_event_subscriptions/1, get_event_subscriptions/2,
         get_event_subscriptions_count/1, get_event_subscriptions_count/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Queries for event subscriptions that fulfill given parameters. The size of the result set can be retrieved by using the [Get Event Subscriptions count](https://docs.camunda.org/manual/7.13/reference/rest/event-subscription/get-query-count/) method.
-spec get_event_subscriptions(ctx:ctx()) -> {ok, [openapi_event_subscription_dto:openapi_event_subscription_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_event_subscriptions(Ctx) ->
    get_event_subscriptions(Ctx, #{}).

-spec get_event_subscriptions(ctx:ctx(), maps:map()) -> {ok, [openapi_event_subscription_dto:openapi_event_subscription_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_event_subscriptions(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/event-subscription"],
    QS = lists:flatten([])++openapi_utils:optional_params(['eventSubscriptionId', 'eventName', 'eventType', 'executionId', 'processInstanceId', 'activityId', 'tenantIdIn', 'withoutTenantId', 'includeEventSubscriptionsWithoutTenantId', 'sortBy', 'sortOrder', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of event subscriptions that fulfill given parameters. Takes the same parameters as the [Get Event Subscriptions](https://docs.camunda.org/manual/7.13/reference/rest/event-subscription/get-query/) method.
-spec get_event_subscriptions_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_event_subscriptions_count(Ctx) ->
    get_event_subscriptions_count(Ctx, #{}).

-spec get_event_subscriptions_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_event_subscriptions_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/event-subscription/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['eventSubscriptionId', 'eventName', 'eventType', 'executionId', 'processInstanceId', 'activityId', 'tenantIdIn', 'withoutTenantId', 'includeEventSubscriptionsWithoutTenantId'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


