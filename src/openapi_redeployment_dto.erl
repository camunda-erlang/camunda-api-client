-module(openapi_redeployment_dto).

-export([encode/1]).

-export_type([openapi_redeployment_dto/0]).

-type openapi_redeployment_dto() ::
    #{ 'resourceIds' => list(),
       'resourceNames' => list(),
       'source' => binary()
     }.

encode(#{ 'resourceIds' := ResourceIds,
          'resourceNames' := ResourceNames,
          'source' := Source
        }) ->
    #{ 'resourceIds' => ResourceIds,
       'resourceNames' => ResourceNames,
       'source' => Source
     }.
