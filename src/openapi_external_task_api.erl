-module(openapi_external_task_api).

-export([complete_external_task_resource/3, complete_external_task_resource/2,
        extend_lock/3, extend_lock/2,
        fetch_and_lock/2, fetch_and_lock/1,
        get_external_task/2, get_external_task/3,
        get_external_task_error_details/2, get_external_task_error_details/3,
        get_external_tasks/1, get_external_tasks/2,
        get_external_tasks_count/1, get_external_tasks_count/2,
        get_topic_names/1, get_topic_names/2,
        handle_external_task_bpmn_error/3, handle_external_task_bpmn_error/2,
        handle_failure/3, handle_failure/2,
        query_external_tasks/2, query_external_tasks/1,
        query_external_tasks_count/2, query_external_tasks_count/1,
        set_external_task_resource_priority/3, set_external_task_resource_priority/2,
        set_external_task_resource_retries/3, set_external_task_resource_retries/2,
        set_external_task_retries/2, set_external_task_retries/1,
        set_external_task_retries_async_operation/2, set_external_task_retries_async_operation/1,
        unlock/2, unlock/3]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Completes an external task by id and updates process variables.
-spec complete_external_task_resource(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
complete_external_task_resource(Ctx, Id) ->
    complete_external_task_resource(Ctx, Id, #{}).

-spec complete_external_task_resource(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
complete_external_task_resource(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	Body = maps:get(body, Optional, []),
	case Body of
		[] -> 
			OpenapiCompleteExternalTaskDto = #{};
		_ ->
			OpenapiCompleteExternalTaskDto = Body
	end,
    Method = post,
    Path = ["/external-task/", Id, "/complete"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCompleteExternalTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),
    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Extends the timeout of the lock by a given amount of time.
-spec extend_lock(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
extend_lock(Ctx, Id) ->
    extend_lock(Ctx, Id, #{}).

-spec extend_lock(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
extend_lock(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/", Id, "/extendLock"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiExtendLockOnExternalTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Fetches and locks a specific number of external tasks for execution by a worker. Query can be restricted to specific task topics and for each task topic an individual lock time can be provided.
-spec fetch_and_lock(ctx:ctx()) -> {ok, [openapi_locked_external_task_dto:openapi_locked_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
fetch_and_lock(Ctx) ->
    fetch_and_lock(Ctx, #{}).

-spec fetch_and_lock(ctx:ctx(), maps:map()) -> {ok, [openapi_locked_external_task_dto:openapi_locked_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
fetch_and_lock(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	Body = maps:get(body, Optional, []),
	case Body of
		[] -> 
			OpenapiFetchExternalTasksDto = #{};
		_ ->
			OpenapiFetchExternalTasksDto = Body
	end,
    Method = post,
    Path = ["/external-task/fetchAndLock"],
    QS = [],
    Headers = [],
    Body1 = OpenapiFetchExternalTasksDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),
    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves an external task by id, corresponding to the `ExternalTask` interface in the engine.
-spec get_external_task(ctx:ctx(), binary()) -> {ok, openapi_external_task_dto:openapi_external_task_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_task(Ctx, Id) ->
    get_external_task(Ctx, Id, #{}).

-spec get_external_task(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_external_task_dto:openapi_external_task_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_task(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/external-task/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the error details in the context of a running external task by id.
-spec get_external_task_error_details(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_task_error_details(Ctx, Id) ->
    get_external_task_error_details(Ctx, Id, #{}).

-spec get_external_task_error_details(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_task_error_details(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/external-task/", Id, "/errorDetails"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the external tasks that fulfill given parameters. Parameters may be static as well as dynamic runtime properties of executions. The size of the result set can be retrieved by using the [Get External Task Count](https://docs.camunda.org/manual/7.13/reference/rest/external-task/get-query-count/) method.
-spec get_external_tasks(ctx:ctx()) -> {ok, [openapi_external_task_dto:openapi_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_tasks(Ctx) ->
    get_external_tasks(Ctx, #{}).

-spec get_external_tasks(ctx:ctx(), maps:map()) -> {ok, [openapi_external_task_dto:openapi_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_tasks(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/external-task"],
    QS = lists:flatten([])++openapi_utils:optional_params(['externalTaskId', 'externalTaskIdIn', 'topicName', 'workerId', 'locked', 'notLocked', 'withRetriesLeft', 'noRetriesLeft', 'lockExpirationAfter', 'lockExpirationBefore', 'activityId', 'activityIdIn', 'executionId', 'processInstanceId', 'processInstanceIdIn', 'processDefinitionId', 'tenantIdIn', 'active', 'suspended', 'priorityHigherThanOrEquals', 'priorityLowerThanOrEquals', 'sortBy', 'sortOrder', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of external tasks that fulfill given parameters. Takes the same parameters as the [Get External Tasks](https://docs.camunda.org/manual/7.13/reference/rest/external-task/get-query/) method.
-spec get_external_tasks_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_tasks_count(Ctx) ->
    get_external_tasks_count(Ctx, #{}).

-spec get_external_tasks_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_external_tasks_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/external-task/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['externalTaskId', 'externalTaskIdIn', 'topicName', 'workerId', 'locked', 'notLocked', 'withRetriesLeft', 'noRetriesLeft', 'lockExpirationAfter', 'lockExpirationBefore', 'activityId', 'activityIdIn', 'executionId', 'processInstanceId', 'processInstanceIdIn', 'processDefinitionId', 'tenantIdIn', 'active', 'suspended', 'priorityHigherThanOrEquals', 'priorityLowerThanOrEquals'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for distinct topic names of external tasks that fulfill given parameters. Query can be restricted to only tasks with retries left, tasks that are locked, or tasks that are unlocked. The parameters withLockedTasks and withUnlockedTasks are exclusive. Setting them both to true will return an empty list. Providing no parameters will return a list of all distinct topic names with external tasks.
-spec get_topic_names(ctx:ctx()) -> {ok, [binary()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_topic_names(Ctx) ->
    get_topic_names(Ctx, #{}).

-spec get_topic_names(ctx:ctx(), maps:map()) -> {ok, [binary()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_topic_names(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/external-task/topic-names"],
    QS = lists:flatten([])++openapi_utils:optional_params(['withLockedTasks', 'withUnlockedTasks', 'withRetriesLeft'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Reports a business error in the context of a running external task by id. The error code must be specified to identify the BPMN error handler.
-spec handle_external_task_bpmn_error(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_external_task_bpmn_error(Ctx, Id) ->
    handle_external_task_bpmn_error(Ctx, Id, #{}).

-spec handle_external_task_bpmn_error(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_external_task_bpmn_error(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/", Id, "/bpmnError"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiExternalTaskBpmnError,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Reports a failure to execute an external task by id. A number of retries and a timeout until the task can be retried can be specified. If retries are set to 0, an incident for this task is created.
-spec handle_failure(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_failure(Ctx, Id) ->
    handle_failure(Ctx, Id, #{}).

-spec handle_failure(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_failure(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/", Id, "/failure"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiExternalTaskFailureDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for external tasks that fulfill given parameters in the form of a JSON object.  This method is slightly more powerful than the [Get External Tasks](https://docs.camunda.org/manual/7.13/reference/rest/external-task/get-query/) method because it allows to specify a hierarchical result sorting.
-spec query_external_tasks(ctx:ctx()) -> {ok, [openapi_external_task_dto:openapi_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_external_tasks(Ctx) ->
    query_external_tasks(Ctx, #{}).

-spec query_external_tasks(ctx:ctx(), maps:map()) -> {ok, [openapi_external_task_dto:openapi_external_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_external_tasks(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task"],
    QS = lists:flatten([])++openapi_utils:optional_params(['firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = #{}, %OpenapiExternalTaskQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of external tasks that fulfill given parameters. This method takes the same message body as the [Get External Tasks (POST)](https://docs.camunda.org/manual/7.13/reference/rest/external-task/post-query/) method.
-spec query_external_tasks_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_external_tasks_count(Ctx) ->
    query_external_tasks_count(Ctx, #{}).

-spec query_external_tasks_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_external_tasks_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/count"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiExternalTaskQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the priority of an existing external task by id. The default value of a priority is 0.
-spec set_external_task_resource_priority(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_resource_priority(Ctx, Id) ->
    set_external_task_resource_priority(Ctx, Id, #{}).

-spec set_external_task_resource_priority(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_resource_priority(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/external-task/", Id, "/priority"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiPriorityDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the number of retries left to execute an external task by id. If retries are set to 0, an  incident is created.
-spec set_external_task_resource_retries(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_resource_retries(Ctx, Id) ->
    set_external_task_resource_retries(Ctx, Id, #{}).

-spec set_external_task_resource_retries(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_resource_retries(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/external-task/", Id, "/retries"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiRetriesDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the number of retries left to execute external tasks by id synchronously. If retries are set to 0,  an incident is created.
-spec set_external_task_retries(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_retries(Ctx) ->
    set_external_task_retries(Ctx, #{}).

-spec set_external_task_retries(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_retries(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/external-task/retries"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiSetRetriesForExternalTasksDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the number of retries left to execute external tasks by id asynchronously. If retries are set to 0, an incident is created.
-spec set_external_task_retries_async_operation(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_retries_async_operation(Ctx) ->
    set_external_task_retries_async_operation(Ctx, #{}).

-spec set_external_task_retries_async_operation(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_external_task_retries_async_operation(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/retries-async"],
    QS = [],
    Headers = [],
    Body1 = #{}, %OpenapiSetRetriesForExternalTasksDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Unlocks an external task by id. Clears the task's lock expiration time and worker id.
-spec unlock(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unlock(Ctx, Id) ->
    unlock(Ctx, Id, #{}).

-spec unlock(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unlock(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/external-task/", Id, "/unlock"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


