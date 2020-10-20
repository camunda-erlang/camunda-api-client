-module(openapi_process_definition_api).

-export([delete_process_definition/2, delete_process_definition/3,
        delete_process_definitions_by_key/2, delete_process_definitions_by_key/3,
        delete_process_definitions_by_key_and_tenant_id/3, delete_process_definitions_by_key_and_tenant_id/4,
        get_activity_statistics/2, get_activity_statistics/3,
        get_activity_statistics_by_process_definition_key/2, get_activity_statistics_by_process_definition_key/3,
        get_activity_statistics_by_process_definition_key_and_tenant_id/3, get_activity_statistics_by_process_definition_key_and_tenant_id/4,
        get_deployed_start_form/2, get_deployed_start_form/3,
        get_deployed_start_form_by_key/2, get_deployed_start_form_by_key/3,
        get_deployed_start_form_by_key_and_tenant_id/3, get_deployed_start_form_by_key_and_tenant_id/4,
        get_latest_process_definition_by_tenant_id/3, get_latest_process_definition_by_tenant_id/4,
        get_process_definition/2, get_process_definition/3,
        get_process_definition_bpmn20_xml/2, get_process_definition_bpmn20_xml/3,
        get_process_definition_bpmn20_xml_by_key/2, get_process_definition_bpmn20_xml_by_key/3,
        get_process_definition_bpmn20_xml_by_key_and_tenant_id/3, get_process_definition_bpmn20_xml_by_key_and_tenant_id/4,
        get_process_definition_by_key/2, get_process_definition_by_key/3,
        get_process_definition_diagram/2, get_process_definition_diagram/3,
        get_process_definition_diagram_by_key/2, get_process_definition_diagram_by_key/3,
        get_process_definition_diagram_by_key_and_tenant_id/3, get_process_definition_diagram_by_key_and_tenant_id/4,
        get_process_definition_statistics/1, get_process_definition_statistics/2,
        get_process_definitions/1, get_process_definitions/2,
        get_process_definitions_count/1, get_process_definitions_count/2,
        get_rendered_start_form/2, get_rendered_start_form/3,
        get_rendered_start_form_by_key/2, get_rendered_start_form_by_key/3,
        get_rendered_start_form_by_key_and_tenant_id/3, get_rendered_start_form_by_key_and_tenant_id/4,
        get_start_form/2, get_start_form/3,
        get_start_form_by_key/2, get_start_form_by_key/3,
        get_start_form_by_key_and_tenant_id/3, get_start_form_by_key_and_tenant_id/4,
        get_start_form_variables/2, get_start_form_variables/3,
        get_start_form_variables_by_key/2, get_start_form_variables_by_key/3,
        get_start_form_variables_by_key_and_tenant_id/3, get_start_form_variables_by_key_and_tenant_id/4,
        restart_process_instance/3, restart_process_instance/2,
        restart_process_instance_async_operation/3, restart_process_instance_async_operation/2,
        start_process_instance/3, start_process_instance/2,
        start_process_instance_by_key/3, start_process_instance_by_key/2,
        start_process_instance_by_key_and_tenant_id/4, start_process_instance_by_key_and_tenant_id/3,
        submit_form/3, submit_form/2,
        submit_form_by_key/3, submit_form_by_key/2,
        submit_form_by_key_and_tenant_id/4, submit_form_by_key_and_tenant_id/3,
        update_history_time_to_live_by_process_definition_id/3, update_history_time_to_live_by_process_definition_id/2,
        update_history_time_to_live_by_process_definition_key/3, update_history_time_to_live_by_process_definition_key/2,
        update_history_time_to_live_by_process_definition_key_and_tenant_id/4, update_history_time_to_live_by_process_definition_key_and_tenant_id/3,
        update_process_definition_suspension_state/2, update_process_definition_suspension_state/1,
        update_process_definition_suspension_state_by_id/3, update_process_definition_suspension_state_by_id/2,
        update_process_definition_suspension_state_by_key/3, update_process_definition_suspension_state_by_key/2,
        update_process_definition_suspension_state_by_key_and_tenant_id/4, update_process_definition_suspension_state_by_key_and_tenant_id/3]).

-define(BASE_URL, "/engine-rest").

%% @doc Delete
%% Deletes a running process instance by id.
-spec delete_process_definition(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definition(Ctx, Id) ->
    delete_process_definition(Ctx, Id, #{}).

-spec delete_process_definition(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definition(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/process-definition/", Id, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['cascade', 'skipCustomListeners', 'skipIoMappings'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete By Key
%% Deletes process definitions by a given key which belong to no tenant id.
-spec delete_process_definitions_by_key(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definitions_by_key(Ctx, Key) ->
    delete_process_definitions_by_key(Ctx, Key, #{}).

-spec delete_process_definitions_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definitions_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/process-definition/key/", Key, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['cascade', 'skipCustomListeners', 'skipIoMappings'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete By Key
%% Deletes process definitions by a given key and which belong to a tenant id.
-spec delete_process_definitions_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definitions_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    delete_process_definitions_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec delete_process_definitions_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_process_definitions_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['cascade', 'skipCustomListeners', 'skipIoMappings'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Activity Instance Statistics
%% Retrieves runtime statistics of a given process definition, grouped by activities. These statistics include the number of running activity instances, optionally the number of failed jobs and also optionally the number of incidents either grouped by incident types or for a specific incident type. **Note**: This does not include historic data.
-spec get_activity_statistics(ctx:ctx(), binary()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics(Ctx, Id) ->
    get_activity_statistics(Ctx, Id, #{}).

-spec get_activity_statistics(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/statistics"],
    QS = lists:flatten([])++openapi_utils:optional_params(['failedJobs', 'incidents', 'incidentsForType'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Activity Instance Statistics
%% Retrieves runtime statistics of the latest version of the given process definition which belongs to no tenant, grouped by activities. These statistics include the number of running activity instances, optionally the number of failed jobs and also optionally the number of incidents either grouped by incident types or for a specific incident type. **Note**: This does not include historic data.
-spec get_activity_statistics_by_process_definition_key(ctx:ctx(), binary()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics_by_process_definition_key(Ctx, Key) ->
    get_activity_statistics_by_process_definition_key(Ctx, Key, #{}).

-spec get_activity_statistics_by_process_definition_key(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics_by_process_definition_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/statistics"],
    QS = lists:flatten([])++openapi_utils:optional_params(['failedJobs', 'incidents', 'incidentsForType'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Activity Instance Statistics
%% Retrieves runtime statistics of the latest version of the given process definition for a tenant, grouped by activities. These statistics include the number of running activity instances, optionally the number of failed jobs and also optionally the number of incidents either grouped by incident types or for a specific incident type. **Note**: This does not include historic data.
-spec get_activity_statistics_by_process_definition_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_activity_statistics_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_activity_statistics_by_process_definition_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_activity_statistics_result_dto:openapi_activity_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_activity_statistics_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/statistics"],
    QS = lists:flatten([])++openapi_utils:optional_params(['failedJobs', 'incidents', 'incidentsForType'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Deployed Start Form
%% Retrieves the deployed form that can be referenced from a start event. For further information please refer to [User Guide](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#embedded-task-forms).
-spec get_deployed_start_form(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form(Ctx, Id) ->
    get_deployed_start_form(Ctx, Id, #{}).

-spec get_deployed_start_form(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/deployed-start-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Deployed Start Form
%% Retrieves the deployed form that can be referenced from a start event. For further information please refer to [User Guide](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#embedded-task-forms).
-spec get_deployed_start_form_by_key(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form_by_key(Ctx, Key) ->
    get_deployed_start_form_by_key(Ctx, Key, #{}).

-spec get_deployed_start_form_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/deployed-start-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Deployed Start Form
%% Retrieves the deployed form that can be referenced from a start event. For further information please refer to [User Guide](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#embedded-task-forms).
-spec get_deployed_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_deployed_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_deployed_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployed_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/deployed-start-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get
%% Retrieves the latest version of the process definition for tenant according to the `ProcessDefinition` interface in the engine.
-spec get_latest_process_definition_by_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_latest_process_definition_by_tenant_id(Ctx, Key, TenantId) ->
    get_latest_process_definition_by_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_latest_process_definition_by_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_latest_process_definition_by_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get
%% Retrieves a process definition according to the `ProcessDefinition` interface in the engine.
-spec get_process_definition(ctx:ctx(), binary()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition(Ctx, Id) ->
    get_process_definition(Ctx, Id, #{}).

-spec get_process_definition(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get XML
%% Retrieves the BPMN 2.0 XML of a process definition.
-spec get_process_definition_bpmn20_xml(ctx:ctx(), binary()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml(Ctx, Id) ->
    get_process_definition_bpmn20_xml(Ctx, Id, #{}).

-spec get_process_definition_bpmn20_xml(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/xml"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get XML
%% Retrieves latest version the BPMN 2.0 XML of a process definition.
-spec get_process_definition_bpmn20_xml_by_key(ctx:ctx(), binary()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml_by_key(Ctx, Key) ->
    get_process_definition_bpmn20_xml_by_key(Ctx, Key, #{}).

-spec get_process_definition_bpmn20_xml_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/xml"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get XML
%% Retrieves latest version the BPMN 2.0 XML of a process definition. Returns the XML for the latest version of the process definition for tenant.
-spec get_process_definition_bpmn20_xml_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_process_definition_bpmn20_xml_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_process_definition_bpmn20_xml_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_process_definition_diagram_dto:openapi_process_definition_diagram_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_bpmn20_xml_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/xml"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get
%% Retrieves the latest version of the process definition which belongs to no tenant according to the `ProcessDefinition` interface in the engine.
-spec get_process_definition_by_key(ctx:ctx(), binary()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_by_key(Ctx, Key) ->
    get_process_definition_by_key(Ctx, Key, #{}).

-spec get_process_definition_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_definition_dto:openapi_process_definition_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Diagram
%% Retrieves the diagram of a process definition.  If the process definition's deployment contains an image resource with the same file name as the process definition, the deployed image will be returned by the Get Diagram endpoint. Example: `someProcess.bpmn` and `someProcess.png`. Supported file extentions for the image are: `svg`, `png`, `jpg`, and `gif`.
-spec get_process_definition_diagram(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram(Ctx, Id) ->
    get_process_definition_diagram(Ctx, Id, #{}).

-spec get_process_definition_diagram(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/diagram"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Diagram
%% Retrieves the diagram for the latest version of the process definition which belongs to no tenant.  If the process definition's deployment contains an image resource with the same file name as the process definition, the deployed image will be returned by the Get Diagram endpoint. Example: `someProcess.bpmn` and `someProcess.png`. Supported file extentions for the image are: `svg`, `png`, `jpg`, and `gif`.
-spec get_process_definition_diagram_by_key(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram_by_key(Ctx, Key) ->
    get_process_definition_diagram_by_key(Ctx, Key, #{}).

-spec get_process_definition_diagram_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/diagram"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Diagram
%% Retrieves the diagram for the latest version of the process definition for tenant.  If the process definition's deployment contains an image resource with the same file name as the process definition, the deployed image will be returned by the Get Diagram endpoint. Example: `someProcess.bpmn` and `someProcess.png`. Supported file extentions for the image are: `svg`, `png`, `jpg`, and `gif`.
-spec get_process_definition_diagram_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_process_definition_diagram_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_process_definition_diagram_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_diagram_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/diagram"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Process Instance Statistics
%% Retrieves runtime statistics of the process engine, grouped by process definitions. These statistics include the number of running process instances, optionally the number of failed jobs and also optionally the number of incidents either grouped by incident types or for a specific incident type. **Note**: This does not include historic data.
-spec get_process_definition_statistics(ctx:ctx()) -> {ok, [openapi_process_definition_statistics_result_dto:openapi_process_definition_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_statistics(Ctx) ->
    get_process_definition_statistics(Ctx, #{}).

-spec get_process_definition_statistics(ctx:ctx(), maps:map()) -> {ok, [openapi_process_definition_statistics_result_dto:openapi_process_definition_statistics_result_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definition_statistics(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/statistics"],
    QS = lists:flatten([])++openapi_utils:optional_params(['failedJobs', 'incidents', 'incidentsForType', 'rootIncidents'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get List
%% Queries for process definitions that fulfill given parameters. Parameters may be the properties of  process definitions, such as the name, key or version. The size of the result set can be retrieved by using the [Get Definition Count](https://docs.camunda.org/manual/7.13/reference/rest/process-definition/get-query-count/) method.
-spec get_process_definitions(ctx:ctx()) -> {ok, [openapi_process_definition_dto:openapi_process_definition_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definitions(Ctx) ->
    get_process_definitions(Ctx, #{}).

-spec get_process_definitions(ctx:ctx(), maps:map()) -> {ok, [openapi_process_definition_dto:openapi_process_definition_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definitions(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition"],
    QS = lists:flatten([])++openapi_utils:optional_params(['processDefinitionId', 'processDefinitionIdIn', 'name', 'nameLike', 'deploymentId', 'deployedAfter', 'deployedAt', 'key', 'keysIn', 'keyLike', 'category', 'categoryLike', 'version', 'latestVersion', 'resourceName', 'resourceNameLike', 'startableBy', 'active', 'suspended', 'incidentId', 'incidentType', 'incidentMessage', 'incidentMessageLike', 'tenantIdIn', 'withoutTenantId', 'includeProcessDefinitionsWithoutTenantId', 'versionTag', 'versionTagLike', 'withoutVersionTag', 'startableInTasklist', 'notStartableInTasklist', 'startablePermissionCheck', 'sortBy', 'sortOrder', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get List Count
%% Requests the number of process definitions that fulfill the query criteria. Takes the same filtering parameters as the [Get Definitions](https://docs.camunda.org/manual/7.13/reference/rest/process-definition/get-query/) method.
-spec get_process_definitions_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definitions_count(Ctx) ->
    get_process_definitions_count(Ctx, #{}).

-spec get_process_definitions_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_process_definitions_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['processDefinitionId', 'processDefinitionIdIn', 'name', 'nameLike', 'deploymentId', 'deployedAfter', 'deployedAt', 'key', 'keysIn', 'keyLike', 'category', 'categoryLike', 'version', 'latestVersion', 'resourceName', 'resourceNameLike', 'startableBy', 'active', 'suspended', 'incidentId', 'incidentType', 'incidentMessage', 'incidentMessageLike', 'tenantIdIn', 'withoutTenantId', 'includeProcessDefinitionsWithoutTenantId', 'versionTag', 'versionTagLike', 'withoutVersionTag', 'startableInTasklist', 'notStartableInTasklist', 'startablePermissionCheck'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Rendered Start Form
%% Retrieves the rendered form for a process definition. This method can be used to get the HTML rendering of a [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec get_rendered_start_form(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form(Ctx, Id) ->
    get_rendered_start_form(Ctx, Id, #{}).

-spec get_rendered_start_form(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/rendered-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Rendered Start Form
%% Retrieves  the rendered form for the latest version of the process definition which belongs to no tenant. This method can be used to get the HTML rendering of a [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec get_rendered_start_form_by_key(ctx:ctx(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form_by_key(Ctx, Key) ->
    get_rendered_start_form_by_key(Ctx, Key, #{}).

-spec get_rendered_start_form_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/rendered-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Rendered Start Form
%% Retrieves  the rendered form for the latest version of the process definition for a tenant. This method can be used to get the HTML rendering of a [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec get_rendered_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_rendered_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_rendered_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_rendered_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/rendered-form"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Key
%% Retrieves the key of the start form for a process definition. The form key corresponds to the `FormData#formKey` property in the engine.
-spec get_start_form(ctx:ctx(), binary()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form(Ctx, Id) ->
    get_start_form(Ctx, Id, #{}).

-spec get_start_form(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/startForm"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Key
%% Retrieves the key of the start form for the latest version of the process definition which belongs to no tenant. The form key corresponds to the `FormData#formKey` property in the engine.
-spec get_start_form_by_key(ctx:ctx(), binary()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_by_key(Ctx, Key) ->
    get_start_form_by_key(Ctx, Key, #{}).

-spec get_start_form_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/startForm"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Key
%% Retrieves the key of the start form for the latest version of the process definition for a tenant. The form key corresponds to the `FormData#formKey` property in the engine.
-spec get_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_start_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_form_dto:openapi_form_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/startForm"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Variables
%% Retrieves the start form variables for a process definition (only if they are defined via the  [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms) approach). The start form variables take form data specified on the start event into account. If form fields are defined, the variable types and default values of the form fields are taken into account.
-spec get_start_form_variables(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables(Ctx, Id) ->
    get_start_form_variables(Ctx, Id, #{}).

-spec get_start_form_variables(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/", Id, "/form-variables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['variableNames', 'deserializeValues'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Variables
%% Retrieves the start form variables for the latest process definition which belongs to no tenant (only if they are defined via the  [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms) approach). The start form variables take form data specified on the start event into account. If form fields are defined, the variable types and default values of the form fields are taken into account.
-spec get_start_form_variables_by_key(ctx:ctx(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables_by_key(Ctx, Key) ->
    get_start_form_variables_by_key(Ctx, Key, #{}).

-spec get_start_form_variables_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/form-variables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['variableNames', 'deserializeValues'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Start Form Variables
%% Retrieves the start form variables for the latest process definition for a tenant (only if they are defined via the  [Generated Task Form](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms) approach). The start form variables take form data specified on the start event into account. If form fields are defined, the variable types and default values of the form fields are taken into account.
-spec get_start_form_variables_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    get_start_form_variables_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec get_start_form_variables_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_start_form_variables_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/form-variables"],
    QS = lists:flatten([])++openapi_utils:optional_params(['variableNames', 'deserializeValues'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Restart Process Instance
%% Restarts process instances that were canceled or terminated synchronously. Can also restart completed process instances. It will create a new instance using the original instance information. To execute the restart asynchronously, use the [Restart Process Instance Async](https://docs.camunda.org/manual/7.13/reference/rest/process-definition/post-restart-process-instance-async/) method.  For more information about the difference between synchronous and asynchronous execution, please refer to the related section of the [User Guide](https://docs.camunda.org/manual/7.13/user-guide/process-engine/process-instance-restart/#execution).
-spec restart_process_instance(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
restart_process_instance(Ctx, Id) ->
    restart_process_instance(Ctx, Id, #{}).

-spec restart_process_instance(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
restart_process_instance(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/", Id, "/restart"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiRestartProcessInstanceDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Restart Process Instance Async
%% Restarts process instances that were canceled or terminated asynchronously. Can also restart completed process instances. It will create a new instance using the original instance information. To execute the restart asynchronously, use the [Restart Process Instance](https://docs.camunda.org/manual/7.13/reference/rest/process-definition/post-restart-process-instance-sync/) method.  For more information about the difference between synchronous and asynchronous execution, please refer to the related section of the [User Guide](https://docs.camunda.org/manual/7.13/user-guide/process-engine/process-instance-restart/#execution).
-spec restart_process_instance_async_operation(ctx:ctx(), binary()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
restart_process_instance_async_operation(Ctx, Id) ->
    restart_process_instance_async_operation(Ctx, Id, #{}).

-spec restart_process_instance_async_operation(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_batch_dto:openapi_batch_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
restart_process_instance_async_operation(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/", Id, "/restart-async"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiRestartProcessInstanceDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Start Instance
%% Instantiates a given process definition. Process variables and business key may be supplied in the request body.
-spec start_process_instance(ctx:ctx(), binary()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance(Ctx, Id) ->
    start_process_instance(Ctx, Id, #{}).

-spec start_process_instance(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/", Id, "/start"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiStartProcessInstanceDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Start Instance
%% Instantiates a given process definition, starts the latest version of the process definition which belongs to no tenant. Process variables and business key may be supplied in the request body.
-spec start_process_instance_by_key(ctx:ctx(), binary()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance_by_key(Ctx, Key) ->
    start_process_instance_by_key(Ctx, Key, #{}).

-spec start_process_instance_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	Body = maps:get(body, Optional, []),
	case Body of
		[] -> 
			OpenapiStartProcessInstanceDto = #{};
		_ ->
			OpenapiStartProcessInstanceDto = Body
	end,
    Method = post,
    Path = ["/process-definition/key/", Key, "/start"],
    QS = [],
    Headers = [],
    Body1 = OpenapiStartProcessInstanceDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),
    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Start Instance
%% Instantiates a given process definition, starts the latest version of the process definition for tenant. Process variables and business key may be supplied in the request body.
-spec start_process_instance_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    start_process_instance_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec start_process_instance_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_process_instance_with_variables_dto:openapi_process_instance_with_variables_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
start_process_instance_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/start"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiStartProcessInstanceDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Submit Start Form
%% Starts a process instance using a set of process variables and the business key. If the start event has Form Field Metadata defined, the process engine will perform backend validation for any form fields which have validators defined. See [Documentation on Generated Task Forms](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec submit_form(ctx:ctx(), binary()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form(Ctx, Id) ->
    submit_form(Ctx, Id, #{}).

-spec submit_form(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/", Id, "/submit-form"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiStartProcessInstanceFormDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Submit Start Form
%% Starts the latest version of the process definition which belongs to no tenant using a set of process variables and the business key. If the start event has Form Field Metadata defined, the process engine will perform backend validation for any form fields which have validators defined. See [Documentation on Generated Task Forms](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec submit_form_by_key(ctx:ctx(), binary()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form_by_key(Ctx, Key) ->
    submit_form_by_key(Ctx, Key, #{}).

-spec submit_form_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/key/", Key, "/submit-form"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiStartProcessInstanceFormDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Submit Start Form
%% Starts the latest version of the process definition for a tenant using a set of process variables and the business key. If the start event has Form Field Metadata defined, the process engine will perform backend validation for any form fields which have validators defined. See [Documentation on Generated Task Forms](https://docs.camunda.org/manual/7.13/user-guide/task-forms/#generated-task-forms).
-spec submit_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    submit_form_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec submit_form_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_process_instance_dto:openapi_process_instance_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
submit_form_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/submit-form"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiStartProcessInstanceFormDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update History Time to Live
%% Updates history time to live for process definition. The field is used within [History cleanup](https://docs.camunda.org/manual/7.13/user-guide/process-engine/history/#history-cleanup).
-spec update_history_time_to_live_by_process_definition_id(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_id(Ctx, Id) ->
    update_history_time_to_live_by_process_definition_id(Ctx, Id, #{}).

-spec update_history_time_to_live_by_process_definition_id(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_id(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/", Id, "/history-time-to-live"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiHistoryTimeToLiveDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update History Time to Live
%% Updates history time to live for the latest version of the process definition which belongs to no tenant. The field is used within [History cleanup](https://docs.camunda.org/manual/7.13/user-guide/process-engine/history/#history-cleanup).
-spec update_history_time_to_live_by_process_definition_key(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_key(Ctx, Key) ->
    update_history_time_to_live_by_process_definition_key(Ctx, Key, #{}).

-spec update_history_time_to_live_by_process_definition_key(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/key/", Key, "/history-time-to-live"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiHistoryTimeToLiveDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update History Time to Live
%% Updates history time to live for the latest version of the process definition for a tenant. The field is used within [History cleanup](https://docs.camunda.org/manual/7.13/user-guide/process-engine/history/#history-cleanup).
-spec update_history_time_to_live_by_process_definition_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId) ->
    update_history_time_to_live_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec update_history_time_to_live_by_process_definition_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_history_time_to_live_by_process_definition_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/history-time-to-live"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiHistoryTimeToLiveDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Activate/Suspend By Key
%% Activates or suspends process definitions with the given process definition key.
-spec update_process_definition_suspension_state(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state(Ctx) ->
    update_process_definition_suspension_state(Ctx, #{}).

-spec update_process_definition_suspension_state(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/suspended"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiProcessDefinitionSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Activate/Suspend By Id
%% Activates or suspends a given process definition by id.
-spec update_process_definition_suspension_state_by_id(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_id(Ctx, Id) ->
    update_process_definition_suspension_state_by_id(Ctx, Id, #{}).

-spec update_process_definition_suspension_state_by_id(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_id(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/", Id, "/suspended"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiProcessDefinitionSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Activate/Suspend by Id
%% Activates or suspends a given process definition by latest version of process definition key which belongs to no tenant.
-spec update_process_definition_suspension_state_by_key(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_key(Ctx, Key) ->
    update_process_definition_suspension_state_by_key(Ctx, Key, #{}).

-spec update_process_definition_suspension_state_by_key(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_key(Ctx, Key, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/key/", Key, "/suspended"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiProcessDefinitionSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Activate/Suspend by Id
%% Activates or suspends a given process definition by the latest version of the process definition for tenant.
-spec update_process_definition_suspension_state_by_key_and_tenant_id(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_key_and_tenant_id(Ctx, Key, TenantId) ->
    update_process_definition_suspension_state_by_key_and_tenant_id(Ctx, Key, TenantId, #{}).

-spec update_process_definition_suspension_state_by_key_and_tenant_id(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_process_definition_suspension_state_by_key_and_tenant_id(Ctx, Key, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = ["/process-definition/key/", Key, "/tenant/", TenantId, "/suspended"],
    QS = [],
    Headers = [],
    Body1 = [], %OpenapiProcessDefinitionSuspensionStateDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


