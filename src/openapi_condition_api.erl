-module(openapi_condition_api).

-export([evaluate_condition/1, evaluate_condition/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Triggers evaluation of conditions for conditional start event(s).  Internally this maps to the engines condition evaluation builder method ConditionEvaluationBuilder#evaluateStartConditions().  For more information see the [Conditional Start Events](https://docs.camunda.org/manual/7.13/reference/bpmn20/events/conditional-events/#conditional-start-event) section of the [BPMN 2.0 Implementation Reference](https://docs.camunda.org/manual/7.13/reference/bpmn20/).
-spec evaluate_condition(ctx:ctx()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
evaluate_condition(Ctx) ->
    evaluate_condition(Ctx, #{}).

-spec evaluate_condition(ctx:ctx(), maps:map()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
evaluate_condition(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiEvaluationConditionDto = #{},

    Method = post,
    Path = ["/condition"],
    QS = [],
    Headers = [],
    Body1 = OpenapiEvaluationConditionDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


