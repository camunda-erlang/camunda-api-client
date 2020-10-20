-module(openapi_start_process_instance_form_dto).

-export([encode/1]).

-export_type([openapi_start_process_instance_form_dto/0]).

-type openapi_start_process_instance_form_dto() ::
    #{ 'variables' => maps:map(),
       'businessKey' => binary()
     }.

encode(#{ 'variables' := Variables,
          'businessKey' := BusinessKey
        }) ->
    #{ 'variables' => Variables,
       'businessKey' => BusinessKey
     }.
