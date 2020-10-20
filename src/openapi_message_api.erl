-module(openapi_message_api).

-export([deliver_message/1, deliver_message/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Correlates a message to the process engine to either trigger a message start event or an intermediate message  catching event. Internally this maps to the engine's message correlation builder methods `MessageCorrelationBuilder#correlateWithResult()` and `MessageCorrelationBuilder#correlateAllWithResult()`. For more information about the correlation behavior, see the [Message Events](https://docs.camunda.org/manual/7.13/bpmn20/events/message-events/) section of the [BPMN 2.0 Implementation Reference](https://docs.camunda.org/manual/7.13/reference/bpmn20/).
-spec deliver_message(ctx:ctx()) -> {ok, [openapi_message_correlation_result_with_variable_dto:openapi_message_correlation_result_with_variable_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
deliver_message(Ctx) ->
    deliver_message(Ctx, #{}).

-spec deliver_message(ctx:ctx(), maps:map()) -> {ok, [openapi_message_correlation_result_with_variable_dto:openapi_message_correlation_result_with_variable_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
deliver_message(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiCorrelationMessageDto = #{},
    Method = post,
    Path = ["/message"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCorrelationMessageDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


