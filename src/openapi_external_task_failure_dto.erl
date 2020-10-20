-module(openapi_external_task_failure_dto).

-export([encode/1]).

-export_type([openapi_external_task_failure_dto/0]).

-type openapi_external_task_failure_dto() ::
    #{ 'workerId' => binary(),
       'errorMessage' => binary(),
       'errorDetails' => binary(),
       'retries' => integer(),
       'retryTimeout' => integer()
     }.

encode(#{ 'workerId' := WorkerId,
          'errorMessage' := ErrorMessage,
          'errorDetails' := ErrorDetails,
          'retries' := Retries,
          'retryTimeout' := RetryTimeout
        }) ->
    #{ 'workerId' => WorkerId,
       'errorMessage' => ErrorMessage,
       'errorDetails' => ErrorDetails,
       'retries' => Retries,
       'retryTimeout' => RetryTimeout
     }.
