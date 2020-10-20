-module(openapi_process_definition_diagram_dto).

-export([encode/1]).

-export_type([openapi_process_definition_diagram_dto/0]).

-type openapi_process_definition_diagram_dto() ::
    #{ 'id' => binary(),
       'bpmn20Xml' => binary()
     }.

encode(#{ 'id' := Id,
          'bpmn20Xml' := Bpmn20Xml
        }) ->
    #{ 'id' => Id,
       'bpmn20Xml' => Bpmn20Xml
     }.
