-module(openapi_process_instance_with_variables_dto).

-export([encode/1]).

-export_type([openapi_process_instance_with_variables_dto/0]).

-type openapi_process_instance_with_variables_dto() ::
    #{ 'variables' => maps:map(),
       'id' => binary(),
       'definitionId' => binary(),
       'businessKey' => binary(),
       'caseInstanceId' => binary(),
       'ended' => boolean(),
       'suspended' => boolean(),
       'tenantId' => binary(),
       'links' => list()
     }.

encode(#{ 'variables' := Variables,
          'id' := Id,
          'definitionId' := DefinitionId,
          'businessKey' := BusinessKey,
          'caseInstanceId' := CaseInstanceId,
          'ended' := Ended,
          'suspended' := Suspended,
          'tenantId' := TenantId,
          'links' := Links
        }) ->
    #{ 'variables' => Variables,
       'id' => Id,
       'definitionId' => DefinitionId,
       'businessKey' => BusinessKey,
       'caseInstanceId' => CaseInstanceId,
       'ended' => Ended,
       'suspended' => Suspended,
       'tenantId' => TenantId,
       'links' => Links
     }.
