-module(openapi_process_instance_dto).

-export([encode/1]).

-export_type([openapi_process_instance_dto/0]).

-type openapi_process_instance_dto() ::
    #{ 'id' => binary(),
       'definitionId' => binary(),
       'businessKey' => binary(),
       'caseInstanceId' => binary(),
       'ended' => boolean(),
       'suspended' => boolean(),
       'tenantId' => binary(),
       'links' => list()
     }.

encode(#{ 'id' := Id,
          'definitionId' := DefinitionId,
          'businessKey' := BusinessKey,
          'caseInstanceId' := CaseInstanceId,
          'ended' := Ended,
          'suspended' := Suspended,
          'tenantId' := TenantId,
          'links' := Links
        }) ->
    #{ 'id' => Id,
       'definitionId' => DefinitionId,
       'businessKey' => BusinessKey,
       'caseInstanceId' => CaseInstanceId,
       'ended' => Ended,
       'suspended' => Suspended,
       'tenantId' => TenantId,
       'links' => Links
     }.
