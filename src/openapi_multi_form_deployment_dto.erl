-module(openapi_multi_form_deployment_dto).

-export([encode/1]).

-export_type([openapi_multi_form_deployment_dto/0]).

-type openapi_multi_form_deployment_dto() ::
    #{ 'tenant_id' => binary(),
       'deployment_source' => binary(),
       'deploy_changed_only' => boolean(),
       'enable_duplicate_filtering' => boolean(),
       'deployment_name' => binary(),
       'data' => binary()
     }.

encode(#{ 'tenant_id' := TenantId,
          'deployment_source' := DeploymentSource,
          'deploy_changed_only' := DeployChangedOnly,
          'enable_duplicate_filtering' := EnableDuplicateFiltering,
          'deployment_name' := DeploymentName,
          'data' := Data
        }) ->
    #{ 'tenant-id' => TenantId,
       'deployment-source' => DeploymentSource,
       'deploy-changed-only' => DeployChangedOnly,
       'enable-duplicate-filtering' => EnableDuplicateFiltering,
       'deployment-name' => DeploymentName,
       'data' => Data
     }.
