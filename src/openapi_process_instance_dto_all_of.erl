-module(openapi_process_instance_dto_all_of).

-export([encode/1]).

-export_type([openapi_process_instance_dto_all_of/0]).

-type openapi_process_instance_dto_all_of() ::
    #{ 'id' => binary(),
       'definitionId' => binary(),
       'businessKey' => binary(),
       'caseInstanceId' => binary(),
       'ended' => boolean(),
       'suspended' => boolean(),
       'tenantId' => binary()
     }.

encode(#{ 'id' := Id,
          'definitionId' := DefinitionId,
          'businessKey' := BusinessKey,
          'caseInstanceId' := CaseInstanceId,
          'ended' := Ended,
          'suspended' := Suspended,
          'tenantId' := TenantId
        }) ->
    #{ 'id' => Id,
       'definitionId' => DefinitionId,
       'businessKey' => BusinessKey,
       'caseInstanceId' => CaseInstanceId,
       'ended' => Ended,
       'suspended' => Suspended,
       'tenantId' => TenantId
     }.
