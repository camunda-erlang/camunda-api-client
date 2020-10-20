-module(openapi_user_id_dto).

-export([encode/1]).

-export_type([openapi_user_id_dto/0]).

-type openapi_user_id_dto() ::
    #{ 'userId' => binary()
     }.

encode(#{ 'userId' := UserId
        }) ->
    #{ 'userId' => UserId
     }.
