-module(openapi_form_dto).

-export([encode/1]).

-export_type([openapi_form_dto/0]).

-type openapi_form_dto() ::
    #{ 'key' => binary(),
       'contextPath' => binary()
     }.

encode(#{ 'key' := Key,
          'contextPath' := ContextPath
        }) ->
    #{ 'key' => Key,
       'contextPath' => ContextPath
     }.
