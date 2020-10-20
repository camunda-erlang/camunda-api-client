-module(openapi_activity_instance_incident_dto).

-export([encode/1]).

-export_type([openapi_activity_instance_incident_dto/0]).

-type openapi_activity_instance_incident_dto() ::
    #{ 'id' => binary(),
       'parentActivityInstanceId' => binary()
     }.

encode(#{ 'id' := Id,
          'parentActivityInstanceId' := ParentActivityInstanceId
        }) ->
    #{ 'id' => Id,
       'parentActivityInstanceId' => ParentActivityInstanceId
     }.
