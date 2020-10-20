-module(openapi_parse_exception_dto_all_of).

-export([encode/1]).

-export_type([openapi_parse_exception_dto_all_of/0]).

-type openapi_parse_exception_dto_all_of() ::
    #{ 'details' => maps:map()
     }.

encode(#{ 'details' := Details
        }) ->
    #{ 'details' => Details
     }.
