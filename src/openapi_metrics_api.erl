-module(openapi_metrics_api).

-export([get_metrics/2, get_metrics/3,
         interval/1, interval/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Retrieves the `sum` (count) for a given metric.
-spec get_metrics(ctx:ctx(), binary()) -> {ok, openapi_metrics_result_dto:openapi_metrics_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_metrics(Ctx, MetricsName) ->
    get_metrics(Ctx, MetricsName, #{}).

-spec get_metrics(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_metrics_result_dto:openapi_metrics_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_metrics(Ctx, MetricsName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/metrics/", MetricsName, "/sum"],
    QS = lists:flatten([])++openapi_utils:optional_params(['startDate', 'endDate'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a list of metrics, aggregated for a given interval.
-spec interval(ctx:ctx()) -> {ok, [openapi_metrics_interval_result_dto:openapi_metrics_interval_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
interval(Ctx) ->
    interval(Ctx, #{}).

-spec interval(ctx:ctx(), maps:map()) -> {ok, [openapi_metrics_interval_result_dto:openapi_metrics_interval_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
interval(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/metrics"],
    QS = lists:flatten([])++openapi_utils:optional_params(['name', 'reporter', 'startDate', 'endDate', 'firstResult', 'maxResults', 'interval', 'aggregateByReporter'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


