-module(openapi_process_definition_statistics_result_dto).

-export([encode/1]).

-export_type([openapi_process_definition_statistics_result_dto/0]).

-type openapi_process_definition_statistics_result_dto() ::
    #{ 'id' => binary(),
       'instances' => integer(),
       'failedJobs' => integer(),
       'incidents' => list(),
       'definition' => openapi_process_definition_dto:openapi_process_definition_dto()
     }.

encode(#{ 'id' := Id,
          'instances' := Instances,
          'failedJobs' := FailedJobs,
          'incidents' := Incidents,
          'definition' := Definition
        }) ->
    #{ 'id' => Id,
       'instances' => Instances,
       'failedJobs' => FailedJobs,
       'incidents' => Incidents,
       'definition' => Definition
     }.
