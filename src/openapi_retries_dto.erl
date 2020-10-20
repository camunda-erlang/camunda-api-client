-module(openapi_retries_dto).

-export([encode/1]).

-export_type([openapi_retries_dto/0]).

-type openapi_retries_dto() ::
    #{ 'retries' => integer()
     }.

encode(#{ 'retries' := Retries
        }) ->
    #{ 'retries' => Retries
     }.
