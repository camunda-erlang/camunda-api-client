-module(openapi_schema_log_api).

-export([get_schema_log/1, get_schema_log/2,
         query_schema_log/1, query_schema_log/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Queries for schema log entries that fulfill given parameters.
-spec get_schema_log(ctx:ctx()) -> {ok, [openapi_schema_log_entry_dto:openapi_schema_log_entry_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_schema_log(Ctx) ->
    get_schema_log(Ctx, #{}).

-spec get_schema_log(ctx:ctx(), maps:map()) -> {ok, [openapi_schema_log_entry_dto:openapi_schema_log_entry_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_schema_log(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/schema/log"],
    QS = lists:flatten([])++openapi_utils:optional_params(['version', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for schema log entries that fulfill given parameters.
-spec query_schema_log(ctx:ctx()) -> {ok, [openapi_schema_log_entry_dto:openapi_schema_log_entry_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_schema_log(Ctx) ->
    query_schema_log(Ctx, #{}).

-spec query_schema_log(ctx:ctx(), maps:map()) -> {ok, [openapi_schema_log_entry_dto:openapi_schema_log_entry_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_schema_log(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiSchemaLogQueryDto = #{},
    Method = post,
    Path = ["/schema/log"],
    QS = lists:flatten([])++openapi_utils:optional_params(['firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiSchemaLogQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


