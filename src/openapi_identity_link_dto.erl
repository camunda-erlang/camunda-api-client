-module(openapi_identity_link_dto).

-export([encode/1]).

-export_type([openapi_identity_link_dto/0]).

-type openapi_identity_link_dto() ::
    #{ 'userId' => binary(),
       'groupId' => binary(),
       'type' := binary()
     }.

encode(#{ 'userId' := UserId,
          'groupId' := GroupId,
          'type' := Type
        }) ->
    #{ 'userId' => UserId,
       'groupId' => GroupId,
       'type' => Type
     }.
