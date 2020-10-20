-module(openapi_linkable_dto).

-export([encode/1]).

-export_type([openapi_linkable_dto/0]).

-type openapi_linkable_dto() ::
    #{ 'links' => list()
     }.

encode(#{ 'links' := Links
        }) ->
    #{ 'links' => Links
     }.
