-module(openapi_patch_variables_dto).

-export([encode/1]).

-export_type([openapi_patch_variables_dto/0]).

-type openapi_patch_variables_dto() ::
    #{ 'modifications' => maps:map(),
       'deletions' => list()
     }.

encode(#{ 'modifications' := Modifications,
          'deletions' := Deletions
        }) ->
    #{ 'modifications' => Modifications,
       'deletions' => Deletions
     }.
