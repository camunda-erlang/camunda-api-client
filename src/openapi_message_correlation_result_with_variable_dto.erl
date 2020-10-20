-module(openapi_message_correlation_result_with_variable_dto).

-export([encode/1]).

-export_type([openapi_message_correlation_result_with_variable_dto/0]).

-type openapi_message_correlation_result_with_variable_dto() ::
    #{ 'resultType' => binary(),
       'processInstance' => openapi_process_instance_dto:openapi_process_instance_dto(),
       'execution' => openapi_execution_dto:openapi_execution_dto(),
       'variables' => maps:map()
     }.

encode(#{ 'resultType' := ResultType,
          'processInstance' := ProcessInstance,
          'execution' := Execution,
          'variables' := Variables
        }) ->
    #{ 'resultType' => ResultType,
       'processInstance' => ProcessInstance,
       'execution' => Execution,
       'variables' => Variables
     }.
