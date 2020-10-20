-module(openapi_exception_dto).

-export([encode/1]).

-export_type([openapi_exception_dto/0]).

-type openapi_exception_dto() ::
    #{ 'type' => binary(),
       'message' => binary()
     }.

encode(#{ 'type' := Type,
          'message' := Message
        }) ->
    #{ 'type' => Type,
       'message' => Message
     }.
