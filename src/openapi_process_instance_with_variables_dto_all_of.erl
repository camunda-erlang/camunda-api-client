-module(openapi_process_instance_with_variables_dto_all_of).

-export([encode/1]).

-export_type([openapi_process_instance_with_variables_dto_all_of/0]).

-type openapi_process_instance_with_variables_dto_all_of() ::
    #{ 'variables' => maps:map()
     }.

encode(#{ 'variables' := Variables
        }) ->
    #{ 'variables' => Variables
     }.
