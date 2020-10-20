-module(openapi_activity_statistics_result_dto).

-export([encode/1]).

-export_type([openapi_activity_statistics_result_dto/0]).

-type openapi_activity_statistics_result_dto() ::
    #{ 'id' => binary(),
       'instances' => integer(),
       'failedJobs' => integer(),
       'incidents' => list()
     }.

encode(#{ 'id' := Id,
          'instances' := Instances,
          'failedJobs' := FailedJobs,
          'incidents' := Incidents
        }) ->
    #{ 'id' => Id,
       'instances' => Instances,
       'failedJobs' => FailedJobs,
       'incidents' => Incidents
     }.
