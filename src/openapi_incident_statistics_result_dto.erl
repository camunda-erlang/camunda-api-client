-module(openapi_incident_statistics_result_dto).

-export([encode/1]).

-export_type([openapi_incident_statistics_result_dto/0]).

-type openapi_incident_statistics_result_dto() ::
    #{ 'incidentType' => binary(),
       'incidentCount' => integer()
     }.

encode(#{ 'incidentType' := IncidentType,
          'incidentCount' := IncidentCount
        }) ->
    #{ 'incidentType' => IncidentType,
       'incidentCount' => IncidentCount
     }.
