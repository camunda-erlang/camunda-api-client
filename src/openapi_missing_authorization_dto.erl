-module(openapi_missing_authorization_dto).

-export([encode/1]).

-export_type([openapi_missing_authorization_dto/0]).

-type openapi_missing_authorization_dto() ::
    #{ 'permissionName' => binary(),
       'resourceName' => binary(),
       'resourceId' => binary()
     }.

encode(#{ 'permissionName' := PermissionName,
          'resourceName' := ResourceName,
          'resourceId' := ResourceId
        }) ->
    #{ 'permissionName' => PermissionName,
       'resourceName' => ResourceName,
       'resourceId' => ResourceId
     }.
