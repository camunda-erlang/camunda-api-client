-module(openapi_problem_dto).

-export([encode/1]).

-export_type([openapi_problem_dto/0]).

-type openapi_problem_dto() ::
    #{ 'message' => binary(),
       'line' => integer(),
       'column' => integer(),
       'mainElementId' => binary(),
       'elementIds' => list()
     }.

encode(#{ 'message' := Message,
          'line' := Line,
          'column' := Column,
          'mainElementId' := MainElementId,
          'elementIds' := ElementIds
        }) ->
    #{ 'message' => Message,
       'line' => Line,
       'column' => Column,
       'mainElementId' => MainElementId,
       'elementIds' => ElementIds
     }.
