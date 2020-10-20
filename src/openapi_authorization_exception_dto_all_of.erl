-module(openapi_authorization_exception_dto_all_of).

-export([encode/1]).

-export_type([openapi_authorization_exception_dto_all_of/0]).

-type openapi_authorization_exception_dto_all_of() ::
    #{ 'userId' => binary(),
       'missingAuthorizations' => list()
     }.

encode(#{ 'userId' := UserId,
          'missingAuthorizations' := MissingAuthorizations
        }) ->
    #{ 'userId' => UserId,
       'missingAuthorizations' => MissingAuthorizations
     }.
