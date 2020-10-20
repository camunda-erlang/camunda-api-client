-module(openapi_version_api).

-export([get_rest_api_version/1, get_rest_api_version/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Retrieves the version of the Rest API.
-spec get_rest_api_version(ctx:ctx()) -> {ok, openapi_version_dto:openapi_version_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rest_api_version(Ctx) ->
    get_rest_api_version(Ctx, #{}).

-spec get_rest_api_version(ctx:ctx(), maps:map()) -> {ok, openapi_version_dto:openapi_version_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rest_api_version(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/version"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


