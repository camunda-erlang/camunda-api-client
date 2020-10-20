-module(openapi_multi_form_variable_binary_dto).

-export([encode/1]).

-export_type([openapi_multi_form_variable_binary_dto/0]).

-type openapi_multi_form_variable_binary_dto() ::
    #{ 'data' => binary(),
       'valueType' => binary()
     }.

encode(#{ 'data' := Data,
          'valueType' := ValueType
        }) ->
    #{ 'data' => Data,
       'valueType' => ValueType
     }.
