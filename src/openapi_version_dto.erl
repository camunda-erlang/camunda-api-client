-module(openapi_version_dto).

-export([encode/1]).

-export_type([openapi_version_dto/0]).

-type openapi_version_dto() ::
    #{ 'version' => binary()
     }.

encode(#{ 'version' := Version
        }) ->
    #{ 'version' => Version
     }.
