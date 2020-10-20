-module(openapi_task_comment_api).

-export([create_comment/2, create_comment/3,
         get_comment/3, get_comment/4,
         get_comments/2, get_comments/3]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Creates a comment for a task by id.
-spec create_comment(ctx:ctx(), binary()) -> {ok, openapi_comment_dto:openapi_comment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_comment(Ctx, Id) ->
    create_comment(Ctx, Id, #{}).

-spec create_comment(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_comment_dto:openapi_comment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_comment(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiCommentDto = #{},
    Method = post,
    Path = ["/task/", Id, "/comment/create"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCommentDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a task comment by task id and comment id.
-spec get_comment(ctx:ctx(), binary(), binary()) -> {ok, openapi_comment_dto:openapi_comment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_comment(Ctx, Id, CommentId) ->
    get_comment(Ctx, Id, CommentId, #{}).

-spec get_comment(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_comment_dto:openapi_comment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_comment(Ctx, Id, CommentId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/comment/", CommentId, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Gets the comments for a task by id.
-spec get_comments(ctx:ctx(), binary()) -> {ok, [openapi_comment_dto:openapi_comment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_comments(Ctx, Id) ->
    get_comments(Ctx, Id, #{}).

-spec get_comments(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_comment_dto:openapi_comment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_comments(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/comment"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


