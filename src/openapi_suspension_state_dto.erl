-module(openapi_suspension_state_dto).

-export([encode/1]).

-export_type([openapi_suspension_state_dto/0]).

-type openapi_suspension_state_dto() ::
    #{ 'suspended' => boolean()
     }.

encode(#{ 'suspended' := Suspended
        }) ->
    #{ 'suspended' => Suspended
     }.
