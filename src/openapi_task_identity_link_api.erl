-module(openapi_task_identity_link_api).

-export([add_identity_link/2, add_identity_link/3,
         delete_identity_link/2, delete_identity_link/3,
         get_identity_links/2, get_identity_links/3]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Adds an identity link to a task by id. Can be used to link any user or group to a task and specify a relation.
-spec add_identity_link(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_identity_link(Ctx, Id) ->
    add_identity_link(Ctx, Id, #{}).

-spec add_identity_link(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_identity_link(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiIdentityLinkDto = #{},
    Method = post,
    Path = ["/task/", Id, "/identity-links"],
    QS = [],
    Headers = [],
    Body1 = OpenapiIdentityLinkDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Removes an identity link from a task by id
-spec delete_identity_link(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_identity_link(Ctx, Id) ->
    delete_identity_link(Ctx, Id, #{}).

-spec delete_identity_link(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_identity_link(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiIdentityLinkDto = #{},
    Method = post,
    Path = ["/task/", Id, "/identity-links/delete"],
    QS = [],
    Headers = [],
    Body1 = OpenapiIdentityLinkDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Gets the identity links for a task by id, which are the users and groups that are in *some* relation to it (including assignee and owner).
-spec get_identity_links(ctx:ctx(), binary()) -> {ok, [openapi_identity_link_dto:openapi_identity_link_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_identity_links(Ctx, Id) ->
    get_identity_links(Ctx, Id, #{}).

-spec get_identity_links(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_identity_link_dto:openapi_identity_link_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_identity_links(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/identity-links"],
    QS = lists:flatten([])++openapi_utils:optional_params(['type'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


