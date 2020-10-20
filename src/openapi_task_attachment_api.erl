-module(openapi_task_attachment_api).

-export([add_attachment/2, add_attachment/3,
         delete_attachment/3, delete_attachment/4,
         get_attachment/3, get_attachment/4,
         get_attachment_data/3, get_attachment_data/4,
         get_attachments/2, get_attachments/3]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Creates an attachment for a task.
-spec add_attachment(ctx:ctx(), binary()) -> {ok, openapi_attachment_dto:openapi_attachment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_attachment(Ctx, Id) ->
    add_attachment(Ctx, Id, #{}).

-spec add_attachment(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_attachment_dto:openapi_attachment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_attachment(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/task/", Id, "/attachment/create"],
    QS = [],
    Headers = [],
    Body1 = {form, []++openapi_utils:optional_params(['attachment-name', 'attachment-description', 'attachment-type', 'url', 'content'], _OptionalParams)},
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Removes an attachment from a task by id.
-spec delete_attachment(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_attachment(Ctx, Id, AttachmentId) ->
    delete_attachment(Ctx, Id, AttachmentId, #{}).

-spec delete_attachment(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_attachment(Ctx, Id, AttachmentId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/task/", Id, "/attachment/", AttachmentId, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a task attachment by task id and attachment id.
-spec get_attachment(ctx:ctx(), binary(), binary()) -> {ok, openapi_attachment_dto:openapi_attachment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachment(Ctx, Id, AttachmentId) ->
    get_attachment(Ctx, Id, AttachmentId, #{}).

-spec get_attachment(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_attachment_dto:openapi_attachment_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachment(Ctx, Id, AttachmentId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/attachment/", AttachmentId, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the binary content of a task attachment by task id and attachment id.
-spec get_attachment_data(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachment_data(Ctx, Id, AttachmentId) ->
    get_attachment_data(Ctx, Id, AttachmentId, #{}).

-spec get_attachment_data(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachment_data(Ctx, Id, AttachmentId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/attachment/", AttachmentId, "/data"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Gets the attachments for a task.
-spec get_attachments(ctx:ctx(), binary()) -> {ok, [openapi_attachment_dto:openapi_attachment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachments(Ctx, Id) ->
    get_attachments(Ctx, Id, #{}).

-spec get_attachments(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_attachment_dto:openapi_attachment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_attachments(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/attachment"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


