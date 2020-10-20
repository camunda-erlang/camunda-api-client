-module(openapi_deployment_api).

-export([create_deployment/1, create_deployment/2,
         delete_deployment/2, delete_deployment/3,
         get_deployment/2, get_deployment/3,
         get_deployment_resource/3, get_deployment_resource/4,
         get_deployment_resource_data/3, get_deployment_resource_data/4,
         get_deployment_resources/2, get_deployment_resources/3,
         get_deployments/1, get_deployments/2,
         get_deployments_count/1, get_deployments_count/2,
         redeploy/2, redeploy/3]).

-define(BASE_URL, "/engine-rest").

%% @doc 
%% Creates a deployment.  **Security Consideration**  Deployments can contain custom code in form of scripts or EL expressions to customize process behavior. This may be abused for remote execution of arbitrary code.
-spec create_deployment(ctx:ctx()) -> {ok, openapi_deployment_with_definitions_dto:openapi_deployment_with_definitions_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_deployment(Ctx) ->
    create_deployment(Ctx, #{}).

-spec create_deployment(ctx:ctx(), maps:map()) -> {ok, openapi_deployment_with_definitions_dto:openapi_deployment_with_definitions_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_deployment(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = ["/deployment/create"],
    QS = [],
    Headers = [],
    Body1 = {form, []++openapi_utils:optional_params(['tenant-id', 'deployment-source', 'deploy-changed-only', 'enable-duplicate-filtering', 'deployment-name', 'data'], _OptionalParams)},
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"multipart/form-data">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Deletes a deployment by id.
-spec delete_deployment(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_deployment(Ctx, Id) ->
    delete_deployment(Ctx, Id, #{}).

-spec delete_deployment(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_deployment(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = ["/deployment/", Id, ""],
    QS = lists:flatten([])++openapi_utils:optional_params(['cascade', 'skipCustomListeners', 'skipIoMappings'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a deployment by id, according to the `Deployment` interface of the engine.
-spec get_deployment(ctx:ctx(), binary()) -> {ok, [openapi_deployment_dto:openapi_deployment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment(Ctx, Id) ->
    get_deployment(Ctx, Id, #{}).

-spec get_deployment(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_deployment_dto:openapi_deployment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment/", Id, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves a deployment resource by resource id for the given deployment.
-spec get_deployment_resource(ctx:ctx(), binary(), binary()) -> {ok, openapi_deployment_resource_dto:openapi_deployment_resource_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resource(Ctx, Id, ResourceId) ->
    get_deployment_resource(Ctx, Id, ResourceId, #{}).

-spec get_deployment_resource(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_deployment_resource_dto:openapi_deployment_resource_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resource(Ctx, Id, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment/", Id, "/resources/", ResourceId, ""],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves the binary content of a deployment resource for the given deployment by id.
-spec get_deployment_resource_data(ctx:ctx(), binary(), binary()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resource_data(Ctx, Id, ResourceId) ->
    get_deployment_resource_data(Ctx, Id, ResourceId, #{}).

-spec get_deployment_resource_data(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, binary(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resource_data(Ctx, Id, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment/", Id, "/resources/", ResourceId, "/data"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Retrieves all deployment resources of a given deployment.
-spec get_deployment_resources(ctx:ctx(), binary()) -> {ok, [openapi_deployment_resource_dto:openapi_deployment_resource_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resources(Ctx, Id) ->
    get_deployment_resources(Ctx, Id, #{}).

-spec get_deployment_resources(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_deployment_resource_dto:openapi_deployment_resource_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployment_resources(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment/", Id, "/resources"],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for deployments that fulfill given parameters. Parameters may be the properties of deployments, such as the id or name or a range of the deployment time. The size of the result set can be retrieved by using the [Get Deployment count](https://docs.camunda.org/manual/7.13/reference/rest/deployment/get-query-count/) method.
-spec get_deployments(ctx:ctx()) -> {ok, [openapi_deployment_dto:openapi_deployment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployments(Ctx) ->
    get_deployments(Ctx, #{}).

-spec get_deployments(ctx:ctx(), maps:map()) -> {ok, [openapi_deployment_dto:openapi_deployment_dto()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployments(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment"],
    QS = lists:flatten([])++openapi_utils:optional_params(['id', 'name', 'nameLike', 'source', 'withoutSource', 'tenantIdIn', 'withoutTenantId', 'includeDeploymentsWithoutTenantId', 'after', 'before', 'sortBy', 'sortOrder', 'firstResult', 'maxResults'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Queries for the number of deployments that fulfill given parameters. Takes the same parameters as the [Get Deployments](https://docs.camunda.org/manual/7.13/reference/rest/deployment/get-query/) method.
-spec get_deployments_count(ctx:ctx()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployments_count(Ctx) ->
    get_deployments_count(Ctx, #{}).

-spec get_deployments_count(ctx:ctx(), maps:map()) -> {ok, openapi_count_result_dto:openapi_count_result_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_deployments_count(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = ["/deployment/count"],
    QS = lists:flatten([])++openapi_utils:optional_params(['id', 'name', 'nameLike', 'source', 'withoutSource', 'tenantIdIn', 'withoutTenantId', 'includeDeploymentsWithoutTenantId', 'after', 'before'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc 
%% Re-deploys an existing deployment.  The deployment resources to re-deploy can be restricted by using the properties `resourceIds` or `resourceNames`. If no deployment resources to re-deploy are passed then all existing resources of the given deployment are re-deployed.  **Warning**: Deployments can contain custom code in form of scripts or EL expressions to customize process behavior. This may be abused for remote execution of arbitrary code. See the section on [security considerations for custom code](https://docs.camunda.org/manual/7.13/user-guide/process-engine/securing-custom-code/) in the user guide for details.
-spec redeploy(ctx:ctx(), binary()) -> {ok, openapi_deployment_with_definitions_dto:openapi_deployment_with_definitions_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
redeploy(Ctx, Id) ->
    redeploy(Ctx, Id, #{}).

-spec redeploy(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_deployment_with_definitions_dto:openapi_deployment_with_definitions_dto(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
redeploy(Ctx, Id, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),
	OpenapiRedeploymentDto = #{},
    Method = post,
    Path = ["/deployment/", Id, "/redeploy"],
    QS = [],
    Headers = [],
    Body1 = OpenapiRedeploymentDto,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


