-module(openapi_priority_dto).

-export([encode/1]).

-export_type([openapi_priority_dto/0]).

-type openapi_priority_dto() ::
    #{ 'priority' => integer()
     }.

encode(#{ 'priority' := Priority
        }) ->
    #{ 'priority' => Priority
     }.
