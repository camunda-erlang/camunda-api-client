-module(openapi_set_job_retries_by_process_dto).

-export([encode/1]).

-export_type([openapi_set_job_retries_by_process_dto/0]).

-type openapi_set_job_retries_by_process_dto() ::
    #{ 'processInstances' => list(),
       'retries' => integer(),
       'processInstanceQuery' => openapi_process_instance_query_dto:openapi_process_instance_query_dto(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto()
     }.

encode(#{ 'processInstances' := ProcessInstances,
          'retries' := Retries,
          'processInstanceQuery' := ProcessInstanceQuery,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery
        }) ->
    #{ 'processInstances' => ProcessInstances,
       'retries' => Retries,
       'processInstanceQuery' => ProcessInstanceQuery,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery
     }.
