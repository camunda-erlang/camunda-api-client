-module(openapi_process_instance_api).

-export([delete_async_historic_query_based/2, delete_async_historic_query_based/1,
         delete_process_instance/2, delete_process_instance/3,
         delete_process_instance_variable/3, delete_process_instance_variable/4,
         delete_process_instances_async_operation/2, delete_process_instances_async_operation/1,
         get_activity_instance_tree/2, get_activity_instance_tree/3,
         get_process_instance_variable/3, get_process_instance_variable/4,
         get_process_instance_variable_binary/3, get_process_instance_variable_binary/4,
         get_process_instance_variables/2, get_process_instance_variables/3,
         get_process_instances/1, get_process_instances/2,
         get_process_instances_count/1, get_process_instances_count/2,
         modify_process_instance/3, modify_process_instance/2,
         modify_process_instance_async_operation/3, modify_process_instance_async_operation/2,
         modify_process_instance_variables/3, modify_process_instance_variables/2,
         query_process_instances/2, query_process_instances/1,
         query_process_instances_count/2, query_process_instances_count/1,
         set_process_instance_variable/4, set_process_instance_variable/3,
         set_process_instance_variable_binary/3, set_process_instance_variable_binary/4,
         set_retries_by_process/2, set_retries_by_process/1,
         set_retries_by_process_historic_query_based/2, set_retries_by_process_historic_query_based/1,
         update_suspension_state/2, update_suspension_state/1,
         update_suspension_state_async_operation/2, update_suspension_state_async_operation/1,
         update_suspension_state_by_id/3, update_suspension_state_by_id/2]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Deletes a set of process instances asynchronously (batch) based on a historic process instance query.
-spec delete_async_historic_query_based(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_async_historic_query_based(Ctx) ->
    delete_async_historic_query_based(Ctx, #{}).

-spec delete_async_historic_query_based(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_async_historic_query_based(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiDeleteProcessInstancesDto = #{},
    Method = post,
    Path = ["/process-instance/delete-historic-query-based"],
    QS = [],
    Headers = [],
    Body1 = OpenapiDeleteProcessInstancesDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Deletes a running process instance by id.
-spec delete_process_instance(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instance(Ctx, Id) ->
    delete_process_instance(Ctx, Id, #{}).

-spec delete_process_instance(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instance(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/process-instance/", Id, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['skipCustomListeners', 'skipIoMappings', 'skipSubprocesses', 'failIfNotExists'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Deletes a variable of a process instance by id.
-spec delete_process_instance_variable(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instance_variable(Ctx, Id, VarName) ->
    delete_process_instance_variable(Ctx, Id, VarName, #{}).

-spec delete_process_instance_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instance_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/process-instance/", Id, "/variables/", VarName, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Deletes multiple process instances asynchronously (batch).
-spec delete_process_instances_async_operation(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instances_async_operation(Ctx) ->
    delete_process_instances_async_operation(Ctx, #{}).

-spec delete_process_instances_async_operation(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_instances_async_operation(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiDeleteProcessInstancesDto = #{},
    Method = post,
    Path = ["/process-instance/delete"],
    QS = [],
    Headers = [],
    Body1 = OpenapiDeleteProcessInstancesDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves an Activity Instance (Tree) for a given process instance by id.
-spec get_activity_instance_tree(ctx:ctx(), binary()) -> {ok, openapi_activity_instance_dto:openapi_activity_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_instance_tree(Ctx, Id) ->
    get_activity_instance_tree(Ctx, Id, #{}).

-spec get_activity_instance_tree(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_activity_instance_dto:openapi_activity_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_instance_tree(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance/", Id, "/activity-instances"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a variable of a given process instance by id.
-spec get_process_instance_variable(ctx:ctx(), binary(), binary()) -> {ok, openapi_variable_value_dto:openapi_variable_value_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variable(Ctx, Id, VarName) ->
    get_process_instance_variable(Ctx, Id, VarName, #{}).

-spec get_process_instance_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_variable_value_dto:openapi_variable_value_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance/", Id, "/variables/", VarName, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['deserializeValue'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the content of a Process Variable by the Process Instance id and the Process Variable name. Applicable for byte array or file Process Variables.
-spec get_process_instance_variable_binary(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variable_binary(Ctx, Id, VarName) ->
    get_process_instance_variable_binary(Ctx, Id, VarName, #{}).

-spec get_process_instance_variable_binary(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variable_binary(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance/", Id, "/variables/", VarName, "/data"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves all variables of a given process instance by id.
-spec get_process_instance_variables(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variables(Ctx, Id) ->
    get_process_instance_variables(Ctx, Id, #{}).

-spec get_process_instance_variables(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instance_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance/", Id, "/variables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['deserializeValue'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for process instances that fulfill given parameters. Parameters may be static as well as dynamic runtime properties of process instances. The size of the result set can be retrieved by using the Get Instance Count method.
-spec get_process_instances(ctx:ctx()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instances(Ctx) ->
    get_process_instances(Ctx, #{}).

-spec get_process_instances(ctx:ctx(), maps:map()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instances(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance"],
    QS = lists:flatten([])++openapi_utils:optional_params(['sortBy', 'sortOrder', 'firstResult', 'maxResults', 'processInstanceIds', 'businessKey', 'businessKeyLike', 'caseInstanceId', 'processDefinitionId', 'processDefinitionKey', 'processDefinitionKeyIn', 'processDefinitionKeyNotIn', 'deploymentId', 'superProcessInstance', 'subProcessInstance', 'superCaseInstance', 'subCaseInstance', 'active', 'suspended', 'withIncident', 'incidentId', 'incidentType', 'incidentMessage', 'incidentMessageLike', 'tenantIdIn', 'withoutTenantId', 'processDefinitionWithoutTenantId', 'activityIdIn', 'rootProcessInstances', 'leafProcessInstances', 'variables', 'variableNamesIgnoreCase', 'variableValuesIgnoreCase'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of process instances that fulfill given parameters.
-spec get_process_instances_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instances_count(Ctx) ->
    get_process_instances_count(Ctx, #{}).

-spec get_process_instances_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_instances_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-instance/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['processInstanceIds', 'businessKey', 'businessKeyLike', 'caseInstanceId', 'processDefinitionId', 'processDefinitionKey', 'processDefinitionKeyIn', 'processDefinitionKeyNotIn', 'deploymentId', 'superProcessInstance', 'subProcessInstance', 'superCaseInstance', 'subCaseInstance', 'active', 'suspended', 'withIncident', 'incidentId', 'incidentType', 'incidentMessage', 'incidentMessageLike', 'tenantIdIn', 'withoutTenantId', 'processDefinitionWithoutTenantId', 'activityIdIn', 'rootProcessInstances', 'leafProcessInstances', 'variables', 'variableNamesIgnoreCase', 'variableValuesIgnoreCase'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Submits a list of modification instructions to change a process instance's execution state. A modification instruction is one of the following:  * Starting execution before an activity * Starting execution after an activity on its single outgoing sequence flow * Starting execution on a specific sequence flow * Canceling an activity instance, transition instance, or all instances (activity or transition) for an activity  Instructions are executed immediately and in the order they are provided in this request's body. Variables can be provided with every starting instruction.  The exact semantics of modification can be read about in the [User guide](https://docs.camunda.org/manual/develop/user-guide/process-engine/process-instance-modification/).
-spec modify_process_instance(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance(Ctx, Id) ->
    modify_process_instance(Ctx, Id, #{}).

-spec modify_process_instance(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceModificationDto = #{},
    Method = post,
    Path = ["/process-instance/", Id, "/modification"],
    QS = [],
    Headers = [],
    Body1 = OpenapiProcessInstanceModificationDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Submits a list of modification instructions to change a process instance's execution state async. A modification instruction is one of the following:  * Starting execution before an activity * Starting execution after an activity on its single outgoing sequence flow * Starting execution on a specific sequence flow * Cancelling an activity instance, transition instance, or all instances (activity or transition) for an activity  Instructions are executed asynchronous and in the order they are provided in this request's body. Variables can be provided with every starting instruction.  The exact semantics of modification can be read about in the [User guide](https://docs.camunda.org/manual/7.13/user-guide/process-engine/process-instance-modification/).
-spec modify_process_instance_async_operation(ctx:ctx(), binary()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance_async_operation(Ctx, Id) ->
    modify_process_instance_async_operation(Ctx, Id, #{}).

-spec modify_process_instance_async_operation(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance_async_operation(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceModificationDto = #{},
    Method = post,
    Path = ["/process-instance/", Id, "/modification-async"],
    QS = [],
    Headers = [],
    Body1 = OpenapiProcessInstanceModificationDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Updates or deletes the variables of a process instance by id. Updates precede deletions. So, if a variable is updated AND deleted, the deletion overrides the update.
-spec modify_process_instance_variables(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance_variables(Ctx, Id) ->
    modify_process_instance_variables(Ctx, Id, #{}).

-spec modify_process_instance_variables(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
modify_process_instance_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiPatchVariablesDto = #{},
    Method = post,
    Path = ["/process-instance/", Id, "/variables"],
    QS = [],
    Headers = [],
    Body1 = OpenapiPatchVariablesDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for process instances that fulfill given parameters through a JSON object. This method is slightly more powerful than the Get Instances method because it allows filtering by multiple process variables of types `string`, `number` or `boolean`.
-spec query_process_instances(ctx:ctx()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_process_instances(Ctx) ->
    query_process_instances(Ctx, #{}).

-spec query_process_instances(ctx:ctx(), maps:map()) -> {ok, [openapi_process_instance_dto:openapi_process_instance_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_process_instances(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceQueryDto = #{},
    Method = post,
    Path = ["/process-instance"],
    QS = lists:flatten([])++openapi_utils:optional_params(['firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiProcessInstanceQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of process instances that fulfill the given parameters. This method takes the same message body as the Get Instances (POST) method and therefore it is slightly more powerful than the Get Instance Count method.
-spec query_process_instances_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_process_instances_count(Ctx) ->
    query_process_instances_count(Ctx, #{}).

-spec query_process_instances_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
query_process_instances_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceQueryDto = #{},
    Method = post,
    Path = ["/process-instance/count"],
    QS = [],
    Headers = [],
    Body1 = OpenapiProcessInstanceQueryDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets a variable of a given process instance by id.
-spec set_process_instance_variable(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_process_instance_variable(Ctx, Id, VarName) ->
    set_process_instance_variable(Ctx, Id, VarName, #{}).

-spec set_process_instance_variable(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_process_instance_variable(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiVariableValueDto = #{},
    Method = put,
    Path = ["/process-instance/", Id, "/variables/", VarName, ""],
    QS = [],
    Headers = [],
    Body1 = OpenapiVariableValueDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Sets the serialized value for a binary variable or the binary value for a file variable.
-spec set_process_instance_variable_binary(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_process_instance_variable_binary(Ctx, Id, VarName) ->
    set_process_instance_variable_binary(Ctx, Id, VarName, #{}).

-spec set_process_instance_variable_binary(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_process_instance_variable_binary(Ctx, Id, VarName, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-instance/", Id, "/variables/", VarName, "/data"],
    QS = [],
    Headers = [],
    Body1 = {form, []++openapi_utils:optional_params(['data', 'valueType'], _OptionalParams)},
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Create a batch to set retries of jobs associated with given processes asynchronously.
-spec set_retries_by_process(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_retries_by_process(Ctx) ->
    set_retries_by_process(Ctx, #{}).

-spec set_retries_by_process(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_retries_by_process(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiSetJobRetriesByProcessDto = #{},
    Method = post,
    Path = ["/process-instance/job-retries"],
    QS = [],
    Headers = [],
    Body1 = OpenapiSetJobRetriesByProcessDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Create a batch to set retries of jobs asynchronously based on a historic process instance query.
-spec set_retries_by_process_historic_query_based(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_retries_by_process_historic_query_based(Ctx) ->
    set_retries_by_process_historic_query_based(Ctx, #{}).

-spec set_retries_by_process_historic_query_based(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_retries_by_process_historic_query_based(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiSetJobRetriesByProcessDto = #{},
    Method = post,
    Path = ["/process-instance/job-retries-historic-query-based"],
    QS = [],
    Headers = [],
    Body1 = OpenapiSetJobRetriesByProcessDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Activates or suspends process instances by providing certain criteria:  # Activate/Suspend Process Instance By Process Definition Id * `suspend` * `processDefinitionId`  # Activate/Suspend Process Instance By Process Definition Key  * `suspend` * `processDefinitionKey` * `processDefinitionTenantId` * `processDefinitionWithoutTenantId`  # Activate/Suspend Process Instance In Group * `suspend` * `processInstanceIds` * `processInstanceQuery` * `historicProcessInstanceQuery`
-spec update_suspension_state(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state(Ctx) ->
    update_suspension_state(Ctx, #{}).

-spec update_suspension_state(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceSuspensionStateDto = #{},
    Method = put,
    Path = ["/process-instance/suspended"],
    QS = [],
    Headers = [],
    Body1 = OpenapiProcessInstanceSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Activates or suspends process instances asynchronously with a list of process instance ids, a process instance query, and/or a historical process instance query.
-spec update_suspension_state_async_operation(ctx:ctx()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state_async_operation(Ctx) ->
    update_suspension_state_async_operation(Ctx, #{}).

-spec update_suspension_state_async_operation(ctx:ctx(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state_async_operation(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiProcessInstanceSuspensionStateAsyncDto = #{},
    Method = post,
    Path = ["/process-instance/suspended-async"],
    QS = [],
    Headers = [],
    Body1 = OpenapiProcessInstanceSuspensionStateAsyncDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Activates or suspends a given process instance by id.
-spec update_suspension_state_by_id(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state_by_id(Ctx, Id) ->
    update_suspension_state_by_id(Ctx, Id, #{}).

-spec update_suspension_state_by_id(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_suspension_state_by_id(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiSuspensionStateDto = #{},
    Method = put,
    Path = ["/process-instance/", Id, "/suspended"],
    QS = [],
    Headers = [],
    Body1 = OpenapiSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


