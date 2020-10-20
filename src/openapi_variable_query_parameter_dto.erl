-module(openapi_variable_query_parameter_dto).

-export([encode/1]).

-export_type([openapi_variable_query_parameter_dto/0]).

-type openapi_variable_query_parameter_dto() ::
    #{ 'value' => maps:map(),
       'operator' => binary()
     }.

encode(#{ 'value' := Value,
          'operator' := Operator
        }) ->
    #{ 'value' => Value,
       'operator' => Operator
     }.
