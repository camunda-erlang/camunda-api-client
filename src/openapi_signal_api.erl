-module(openapi_signal_api).

-export([throw_signal/1, throw_signal/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% A signal is an event of global scope (broadcast semantics) and is delivered to all active handlers. Internally this maps to the engine's signal event received builder method `RuntimeService#createSignalEvent()`. For more information about the signal behavior, see the [Signal Events](https://docs.camunda.org/manual/7.13/reference/bpmn20/events/signal-events/) section of the [BPMN 2.0 Implementation Reference](https://docs.camunda.org/manual/7.13/reference/bpmn20/).
-spec throw_signal(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
throw_signal(Ctx) ->
    throw_signal(Ctx, #{}).

-spec throw_signal(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
throw_signal(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiSignalDto = #{},
    Method = post,
    Path = ["/signal"],
    QS = [],
    Headers = [],
    Body1 = OpenapiSignalDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


