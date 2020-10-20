-module(openapi_set_retries_for_external_tasks_dto).

-export([encode/1]).

-export_type([openapi_set_retries_for_external_tasks_dto/0]).

-type openapi_set_retries_for_external_tasks_dto() ::
    #{ 'retries' => integer(),
       'externalTaskIds' => list(),
       'processInstanceIds' => list(),
       'externalTaskQuery' => openapi_external_task_query_dto:openapi_external_task_query_dto(),
       'processInstanceQuery' => openapi_process_instance_query_dto:openapi_process_instance_query_dto(),
       'historicProcessInstanceQuery' => openapi_historic_process_instance_query_dto:openapi_historic_process_instance_query_dto()
     }.

encode(#{ 'retries' := Retries,
          'externalTaskIds' := ExternalTaskIds,
          'processInstanceIds' := ProcessInstanceIds,
          'externalTaskQuery' := ExternalTaskQuery,
          'processInstanceQuery' := ProcessInstanceQuery,
          'historicProcessInstanceQuery' := HistoricProcessInstanceQuery
        }) ->
    #{ 'retries' => Retries,
       'externalTaskIds' => ExternalTaskIds,
       'processInstanceIds' => ProcessInstanceIds,
       'externalTaskQuery' => ExternalTaskQuery,
       'processInstanceQuery' => ProcessInstanceQuery,
       'historicProcessInstanceQuery' => HistoricProcessInstanceQuery
     }.
