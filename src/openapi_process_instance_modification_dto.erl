-module(openapi_process_instance_modification_dto).

-export([encode/1]).

-export_type([openapi_process_instance_modification_dto/0]).

-type openapi_process_instance_modification_dto() ::
    #{ 'skipCustomListeners' => boolean(),
       'skipIoMappings' => boolean(),
       'instructions' => list(),
       'annotation' => binary()
     }.

encode(#{ 'skipCustomListeners' := SkipCustomListeners,
          'skipIoMappings' := SkipIoMappings,
          'instructions' := Instructions,
          'annotation' := Annotation
        }) ->
    #{ 'skipCustomListeners' => SkipCustomListeners,
       'skipIoMappings' => SkipIoMappings,
       'instructions' => Instructions,
       'annotation' => Annotation
     }.
