-module(openapi_trigger_variable_value_dto).

-export([encode/1]).

-export_type([openapi_trigger_variable_value_dto/0]).

-type openapi_trigger_variable_value_dto() ::
    #{ 'local' => boolean(),
       'value' => maps:map(),
       'type' => binary(),
       'valueInfo' => maps:map()
     }.

encode(#{ 'local' := Local,
          'value' := Value,
          'type' := Type,
          'valueInfo' := ValueInfo
        }) ->
    #{ 'local' => Local,
       'value' => Value,
       'type' => Type,
       'valueInfo' => ValueInfo
     }.
