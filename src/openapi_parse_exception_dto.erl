-module(openapi_parse_exception_dto).

-export([encode/1]).

-export_type([openapi_parse_exception_dto/0]).

-type openapi_parse_exception_dto() ::
    #{ 'details' => maps:map(),
       'type' => binary(),
       'message' => binary()
     }.

encode(#{ 'details' := Details,
          'type' := Type,
          'message' := Message
        }) ->
    #{ 'details' => Details,
       'type' => Type,
       'message' => Message
     }.
