-module(openapi_resource_report_dto).

-export([encode/1]).

-export_type([openapi_resource_report_dto/0]).

-type openapi_resource_report_dto() ::
    #{ 'errors' => list(),
       'warnings' => list()
     }.

encode(#{ 'errors' := Errors,
          'warnings' := Warnings
        }) ->
    #{ 'errors' => Errors,
       'warnings' => Warnings
     }.
