-module(openapi_trigger_variable_value_dto_all_of).

-export([encode/1]).

-export_type([openapi_trigger_variable_value_dto_all_of/0]).

-type openapi_trigger_variable_value_dto_all_of() ::
    #{ 'local' => boolean()
     }.

encode(#{ 'local' := Local
        }) ->
    #{ 'local' => Local
     }.
