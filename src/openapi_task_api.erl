-module(openapi_task_api).

-export([claim/3, claim/2,
         complete/3, complete/2,
         create_task/2, create_task/1,
         delegate_task/3, delegate_task/2,
         delete_task/2, delete_task/3,
         get_deployed_form/2, get_deployed_form/3,
         get_form/2, get_form/3,
         get_form_variables/2, get_form_variables/3,
         get_rendered_form/2, get_rendered_form/3,
         get_task/2, get_task/3,
         get_tasks/1, get_tasks/2,
         get_tasks_count/1, get_tasks_count/2,
         handle_bpmn_error/3, handle_bpmn_error/2,
         handle_escalation/3, handle_escalation/2,
         query_tasks/2, query_tasks/1,
         query_tasks_count/2, query_tasks_count/1,
         resolve/3, resolve/2,
         set_assignee/3, set_assignee/2,
         submit/3, submit/2,
         unclaim/2, unclaim/3,
         update_task/3, update_task/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Claims a task for a specific user.  **Note:** The difference with the [Set Assignee](https://docs.camunda.org/manual/7.13/reference/rest/task/post-assignee/) method is that here a check is performed to see if the task already has a user assigned to it.
-spec claim(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
claim(Ctx, Id) ->
    claim(Ctx, Id, #{}).

-spec claim(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
claim(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiUserIdDto = #{},
    Method = post,
    Path = ["/task/", Id, "/claim"],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserIdDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Completes a task and updates process variables.
-spec complete(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
complete(Ctx, Id) ->
    complete(Ctx, Id, #{}).

-spec complete(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
complete(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiCompleteTaskDto = #{},
    Method = post,
    Path = ["/task/", Id, "/complete"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCompleteTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Creates a new task.
-spec create_task(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_task(Ctx) ->
    create_task(Ctx, #{}).

-spec create_task(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_task(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskDto = #{},
    Method = post,
    Path = ["/task/create"],
    QS = [],
    Headers = [],
    Body1 = OpenapiTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Delegates a task to another user.
-spec delegate_task(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delegate_task(Ctx, Id) ->
    delegate_task(Ctx, Id, #{}).

-spec delegate_task(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delegate_task(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiUserIdDto = #{},
    Method = post,
    Path = ["/task/", Id, "/delegate"],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserIdDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Removes a task by id.
-spec delete_task(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_task(Ctx, Id) ->
    delete_task(Ctx, Id, #{}).

-spec delete_task(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_task(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/task/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the deployed form that is referenced from a given task. For further information please refer to the [User Guide](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#embedded-task-forms).
-spec get_deployed_form(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_form(Ctx, Id) ->
    get_deployed_form(Ctx, Id, #{}).

-spec get_deployed_form(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/deployed-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the form key for a task. The form key corresponds to the `FormData#formKey` property in the engine. This key can be used to do task-specific form rendering in client applications. Additionally, the context path of the containing process application is returned.
-spec get_form(ctx:ctx(), binary()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_form(Ctx, Id) ->
    get_form(Ctx, Id, #{}).

-spec get_form(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the form variables for a task. The form variables take form data specified on the task into account. If form fields are defined, the variable types and default values of the form fields are taken into account.
-spec get_form_variables(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_form_variables(Ctx, Id) ->
    get_form_variables(Ctx, Id, #{}).

-spec get_form_variables(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_form_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/form-variables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['variableNames', 'deserializeValues'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the rendered form for a task. This method can be used to get the HTML rendering of a [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec get_rendered_form(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_form(Ctx, Id) ->
    get_rendered_form(Ctx, Id, #{}).

-spec get_rendered_form(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, "/rendered-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a task by id.
-spec get_task(ctx:ctx(), binary()) -> {ok, openapi_task_dto:openapi_task_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task(Ctx, Id) ->
    get_task(Ctx, Id, #{}).

-spec get_task(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_task_dto:openapi_task_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_task(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for tasks that fulfill a given filter. The size of the result set can be retrieved by using the Get Task Count method.  **Security Consideration:** There are several query parameters (such as assigneeExpression) for specifying an EL expression. These are disabled by default to prevent remote code execution. See the section on [security considerations](https://docs.camunda.org/manual/7.13/user-guide/process-engine/securing-custom-code/) for custom code in the user guide for details.
-spec get_tasks(ctx:ctx()) -> {ok, [openapi_task_dto:openapi_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tasks(Ctx) ->
    get_tasks(Ctx, #{}).

-spec get_tasks(ctx:ctx(), maps:map()) -> {ok, [openapi_task_dto:openapi_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tasks(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task"],
    QS = lists:flatten([])++openapi_utils:optional_params(['processInstanceId', 'processInstanceIdIn', 'processInstanceBusinessKey', 'processInstanceBusinessKeyExpression', 'processInstanceBusinessKeyIn', 'processInstanceBusinessKeyLike', 'processInstanceBusinessKeyLikeExpression', 'processDefinitionId', 'processDefinitionKey', 'processDefinitionKeyIn', 'processDefinitionName', 'processDefinitionNameLike', 'executionId', 'caseInstanceId', 'caseInstanceBusinessKey', 'caseInstanceBusinessKeyLike', 'caseDefinitionId', 'caseDefinitionKey', 'caseDefinitionName', 'caseDefinitionNameLike', 'caseExecutionId', 'activityInstanceIdIn', 'tenantIdIn', 'withoutTenantId', 'assignee', 'assigneeExpression', 'assigneeLike', 'assigneeLikeExpression', 'assigneeIn', 'owner', 'ownerExpression', 'candidateGroup', 'candidateGroupExpression', 'candidateUser', 'candidateUserExpression', 'includeAssignedTasks', 'involvedUser', 'involvedUserExpression', 'assigned', 'unassigned', 'taskDefinitionKey', 'taskDefinitionKeyIn', 'taskDefinitionKeyLike', 'name', 'nameNotEqual', 'nameLike', 'nameNotLike', 'description', 'descriptionLike', 'priority', 'maxPriority', 'minPriority', 'dueDate', 'dueDateExpression', 'dueAfter', 'dueAfterExpression', 'dueBefore', 'dueBeforeExpression', 'followUpDate', 'followUpDateExpression', 'followUpAfter', 'followUpAfterExpression', 'followUpBefore', 'followUpBeforeExpression', 'followUpBeforeOrNotExistent', 'followUpBeforeOrNotExistentExpression', 'createdOn', 'createdOnExpression', 'createdAfter', 'createdAfterExpression', 'createdBefore', 'createdBeforeExpression', 'delegationState', 'candidateGroups', 'candidateGroupsExpression', 'withCandidateGroups', 'withoutCandidateGroups', 'withCandidateUsers', 'withoutCandidateUsers', 'active', 'suspended', 'taskVariables', 'processVariables', 'caseInstanceVariables', 'variableNamesIgnoreCase', 'variableValuesIgnoreCase', 'parentTaskId', 'sortBy', 'sortOrder', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the number of tasks that fulfill a provided filter. Corresponds to the size of the result set when using the [Get Tasks](https://docs.camunda.org/manual/7.13/reference/rest/task/) method.  **Security Consideration:** There are several query parameters (such as assigneeExpression) for specifying an EL expression. These are disabled by default to prevent remote code execution. See the section on [security considerations](https://docs.camunda.org/manual/7.13/user-guide/process-engine/securing-custom-code/) for custom code in the user guide for details.
-spec get_tasks_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tasks_count(Ctx) ->
    get_tasks_count(Ctx, #{}).

-spec get_tasks_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tasks_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/task/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['processInstanceId', 'processInstanceIdIn', 'processInstanceBusinessKey', 'processInstanceBusinessKeyExpression', 'processInstanceBusinessKeyIn', 'processInstanceBusinessKeyLike', 'processInstanceBusinessKeyLikeExpression', 'processDefinitionId', 'processDefinitionKey', 'processDefinitionKeyIn', 'processDefinitionName', 'processDefinitionNameLike', 'executionId', 'caseInstanceId', 'caseInstanceBusinessKey', 'caseInstanceBusinessKeyLike', 'caseDefinitionId', 'caseDefinitionKey', 'caseDefinitionName', 'caseDefinitionNameLike', 'caseExecutionId', 'activityInstanceIdIn', 'tenantIdIn', 'withoutTenantId', 'assignee', 'assigneeExpression', 'assigneeLike', 'assigneeLikeExpression', 'assigneeIn', 'owner', 'ownerExpression', 'candidateGroup', 'candidateGroupExpression', 'candidateUser', 'candidateUserExpression', 'includeAssignedTasks', 'involvedUser', 'involvedUserExpression', 'assigned', 'unassigned', 'taskDefinitionKey', 'taskDefinitionKeyIn', 'taskDefinitionKeyLike', 'name', 'nameNotEqual', 'nameLike', 'nameNotLike', 'description', 'descriptionLike', 'priority', 'maxPriority', 'minPriority', 'dueDate', 'dueDateExpression', 'dueAfter', 'dueAfterExpression', 'dueBefore', 'dueBeforeExpression', 'followUpDate', 'followUpDateExpression', 'followUpAfter', 'followUpAfterExpression', 'followUpBefore', 'followUpBeforeExpression', 'followUpBeforeOrNotExistent', 'followUpBeforeOrNotExistentExpression', 'createdOn', 'createdOnExpression', 'createdAfter', 'createdAfterExpression', 'createdBefore', 'createdBeforeExpression', 'delegationState', 'candidateGroups', 'candidateGroupsExpression', 'withCandidateGroups', 'withoutCandidateGroups', 'withCandidateUsers', 'withoutCandidateUsers', 'active', 'suspended', 'taskVariables', 'processVariables', 'caseInstanceVariables', 'variableNamesIgnoreCase', 'variableValuesIgnoreCase', 'parentTaskId'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Reports a business error in the context of a running task by id. The error code must be specified to identify the BPMN error handler. See the documentation for [Reporting Bpmn Error](https://docs.camunda.org/manual/7.13/reference/bpmn20/tasks/user-task/#reporting-bpmn-error) in User Tasks.
-spec handle_bpmn_error(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_bpmn_error(Ctx, Id) ->
    handle_bpmn_error(Ctx, Id, #{}).

-spec handle_bpmn_error(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_bpmn_error(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskBpmnErrorDto = #{},
    Method = post,
    Path = ["/task/", Id, "/bpmnError"],
    QS = [],
    Headers = [],
    Body1 = OpenapiTaskBpmnErrorDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Reports an escalation in the context of a running task by id. The escalation code must be specified to identify the escalation handler. See the documentation for [Reporting Bpmn Escalation](https://docs.camunda.org/manual/7.13/reference/bpmn20/tasks/user-task/#reporting-bpmn-escalation) in User Tasks.
-spec handle_escalation(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_escalation(Ctx, Id) ->
    handle_escalation(Ctx, Id, #{}).

-spec handle_escalation(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
handle_escalation(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskEscalationDto = #{},
    Method = post,
    Path = ["/task/", Id, "/bpmnEscalation"],
    QS = [],
    Headers = [],
    Body1 = OpenapiTaskEscalationDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for tasks that fulfill a given filter. This method is slightly more powerful than the [Get Tasks](https://docs.camunda.org/manual/7.13/reference/rest/task/get-query/) method because it allows filtering by multiple process or task variables of types `String`, `Number` or `Boolean`. The size of the result set can be retrieved by using the [Get Task Count (POST)](https://docs.camunda.org/manual/7.13/reference/rest/task/post-query-count/) method.  **Security Consideration**: There are several parameters (such as `assigneeExpression`) for specifying an EL expression. These are disabled by default to prevent remote code execution. See the section on [security considerations for custom code](https://docs.camunda.org/manual/7.13/user-guide/process-engine/securing-custom-code/) in the user guide for details.
-spec query_tasks(ctx:ctx()) -> {ok, [openapi_task_dto:openapi_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_tasks(Ctx) ->
    query_tasks(Ctx, #{}).

-spec query_tasks(ctx:ctx(), maps:map()) -> {ok, [openapi_task_dto:openapi_task_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_tasks(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskQueryDto = #{},
    Method = post,
    Path = ["/task"],
    QS = lists:flatten([])++openapi_utils:optional_params(['firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiTaskQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the number of tasks that fulfill the given filter. Corresponds to the size of the result set of the [Get Tasks (POST)](https://docs.camunda.org/manual/7.13/reference/rest/task/post-query/) method and takes the same parameters.  **Security Consideration**: There are several parameters (such as `assigneeExpression`) for specifying an EL expression. These are disabled by default to prevent remote code execution. See the section on [security considerations for custom code](https://docs.camunda.org/manual/7.13/user-guide/process-engine/securing-custom-code/) in the user guide for details.
-spec query_tasks_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_tasks_count(Ctx) ->
    query_tasks_count(Ctx, #{}).

-spec query_tasks_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_tasks_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskQueryDto = #{},
    Method = post,
    Path = ["/task/count"],
    QS = [],
    Headers = [],
    Body1 = OpenapiTaskQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Resolves a task and updates execution variables.  Resolving a task marks that the assignee is done with the task delegated to them, and that it can be sent back to the owner. Can only be executed when the task has been delegated. The assignee will be set to the owner, who performed the delegation.
-spec resolve(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
resolve(Ctx, Id) ->
    resolve(Ctx, Id, #{}).

-spec resolve(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
resolve(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiCompleteTaskDto = #{},
    Method = post,
    Path = ["/task/", Id, "/resolve"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCompleteTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Changes the assignee of a task to a specific user.  **Note:** The difference with the [Claim Task](https://docs.camunda.org/manual/7.13/reference/rest/task/post-claim/) method is that this method does not check if the task already has a user assigned to it.
-spec set_assignee(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_assignee(Ctx, Id) ->
    set_assignee(Ctx, Id, #{}).

-spec set_assignee(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_assignee(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiUserIdDto = #{},
    Method = post,
    Path = ["/task/", Id, "/assignee"],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserIdDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Completes a task and updates process variables using a form submit. There are two difference between this method and the `complete` method:  * If the task is in state `PENDING` - i.e., has been delegated before, it is not completed but resolved. Otherwise it will be completed. * If the task has Form Field Metadata defined, the process engine will perform backend validation for any form fields which have validators defined. See the [Generated Task Forms](https://docs.camunda.org/manual/7.13/user-guide/task-forms/_index/#generated-task-forms) section of the [User Guide](https://docs.camunda.org/manual/7.13/user-guide/) for more information.
-spec submit(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit(Ctx, Id) ->
    submit(Ctx, Id, #{}).

-spec submit(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiCompleteTaskDto = #{},
    Method = post,
    Path = ["/task/", Id, "/submit-form"],
    QS = [],
    Headers = [],
    Body1 = OpenapiCompleteTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Resets a task's assignee. If successful, the task is not assigned to a user.
-spec unclaim(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unclaim(Ctx, Id) ->
    unclaim(Ctx, Id, #{}).

-spec unclaim(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unclaim(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/task/", Id, "/unclaim"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Updates a task.
-spec update_task(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_task(Ctx, Id) ->
    update_task(Ctx, Id, #{}).

-spec update_task(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_task(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiTaskDto = #{},
    Method = put,
    Path = ["/task/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = OpenapiTaskDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


