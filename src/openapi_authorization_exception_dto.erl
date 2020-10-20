-module(openapi_authorization_exception_dto).

-export([encode/1]).

-export_type([openapi_authorization_exception_dto/0]).

-type openapi_authorization_exception_dto() ::
    #{ 'userId' => binary(),
       'missingAuthorizations' => list(),
       'type' => binary(),
       'message' => binary()
     }.

encode(#{ 'userId' := UserId,
          'missingAuthorizations' := MissingAuthorizations,
          'type' := Type,
          'message' := Message
        }) ->
    #{ 'userId' => UserId,
       'missingAuthorizations' => MissingAuthorizations,
       'type' => Type,
       'message' => Message
     }.
