-module(openapi_variable_value_dto).

-export([encode/1]).

-export_type([openapi_variable_value_dto/0]).

-type openapi_variable_value_dto() ::
    #{ 'value' => maps:map(),
       'type' => binary(),
       'valueInfo' => maps:map()
     }.

encode(#{ 'value' := Value,
          'type' := Type,
          'valueInfo' := ValueInfo
        }) ->
    #{ 'value' => Value,
       'type' => Type,
       'valueInfo' => ValueInfo
     }.
