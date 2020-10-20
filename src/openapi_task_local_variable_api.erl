-module(openapi_task_local_variable_api).

-export([delete_task_local_variable/3, delete_task_local_variable/4,
         get_task_local_variable/3, get_task_local_variable/4,
         get_task_local_variable_binary/3, get_task_local_variable_binary/4,
         get_task_local_variables/2, get_task_local_variables/3,
         modify_task_local_variables/2, modify_task_local_variables/3,
         put_task_local_variable/3, put_task_local_variable/4,
         set_binary_task_local_variable/3, set_binary_task_local_variable/4]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Removes a local variable from a task by id.
-spec delete_task_local_variable(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_task_local_variable(Ctx, Id, VarName) ->
    delete_task_local_variable(Ctx, Id, VarName, #{}).

-spec delete_task_local_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_task_local_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/task/", Id, "/localVariables/", VarName, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a variable from the context of a given task by id.
-spec get_task_local_variable(ctx:ctx(), binary(), binary()) -> {ok, openapi_variable_value_dto:openapi_variable_value_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variable(Ctx, Id, VarName) ->
    get_task_local_variable(Ctx, Id, VarName, #{}).

-spec get_task_local_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_variable_value_dto:openapi_variable_value_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/localVariables/", VarName, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['deserializeValue'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a binary variable from the context of a given task by id. Applicable for byte array and file variables.
-spec get_task_local_variable_binary(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variable_binary(Ctx, Id, VarName) ->
    get_task_local_variable_binary(Ctx, Id, VarName, #{}).

-spec get_task_local_variable_binary(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variable_binary(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/localVariables/", VarName, "/data"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves all variables of a given task by id.
-spec get_task_local_variables(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variables(Ctx, Id) ->
    get_task_local_variables(Ctx, Id, #{}).

-spec get_task_local_variables(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task_local_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/localVariables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['deserializeValues'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Updates or deletes the variables in the context of a task. Updates precede deletions. So, if a variable is updated AND deleted, the deletion overrides the update.
-spec modify_task_local_variables(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_task_local_variables(Ctx, Id) ->
    modify_task_local_variables(Ctx, Id, #{}).

-spec modify_task_local_variables(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_task_local_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiPatchVariablesDto = #{},
    Method = post,
    Path = ["/task/", Id, "/localVariables"],
    QS = [],
    Headers = [],
    Body1 = OpenapiPatchVariablesDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets a variable in the context of a given task.
-spec put_task_local_variable(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
put_task_local_variable(Ctx, Id, VarName) ->
    put_task_local_variable(Ctx, Id, VarName, #{}).

-spec put_task_local_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
put_task_local_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiVariableValueDto = #{},
    Method = put,
    Path = ["/task/", Id, "/localVariables/", VarName, ""],
    QS = [],
    Headers = [],
    Body1 = OpenapiVariableValueDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the serialized value for a binary variable or the binary value for a file variable.
-spec set_binary_task_local_variable(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_binary_task_local_variable(Ctx, Id, VarName) ->
    set_binary_task_local_variable(Ctx, Id, VarName, #{}).

-spec set_binary_task_local_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_binary_task_local_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/task/", Id, "/localVariables/", VarName, "/data"],
    QS = [],
    Headers = [],
    Body1 = {form, []++openapi_utils:optional_params(['data', 'valueType'], _OptionalParams)},
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


