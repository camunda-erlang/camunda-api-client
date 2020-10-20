-module(openapi_engine_api).

-export([get_process_engine_names/1, get_process_engine_names/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Retrieves the names of all process engines available on your platform. **Note**: You cannot prepend `/engine/{name}` to this method.
-spec get_process_engine_names(ctx:ctx()) -> {ok, [openapi_process_engine_dto:openapi_process_engine_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_engine_names(Ctx) ->
    get_process_engine_names(Ctx, #{}).

-spec get_process_engine_names(ctx:ctx(), maps:map()) -> {ok, [openapi_process_engine_dto:openapi_process_engine_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_engine_names(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/engine"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


