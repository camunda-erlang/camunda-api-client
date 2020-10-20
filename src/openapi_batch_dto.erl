-module(openapi_batch_dto).

-export([encode/1]).

-export_type([openapi_batch_dto/0]).

-type openapi_batch_dto() ::
    #{ 'id' => binary(),
       'type' => binary(),
       'totalJobs' => integer(),
       'jobsCreated' => integer(),
       'batchJobsPerSeed' => integer(),
       'invocationsPerBatchJob' => integer(),
       'seedJobDefinitionId' => binary(),
       'monitorJobDefinitionId' => binary(),
       'batchJobDefinitionId' => binary(),
       'suspended' => boolean(),
       'tenantId' => binary(),
       'createUserId' => binary()
     }.

encode(#{ 'id' := Id,
          'type' := Type,
          'totalJobs' := TotalJobs,
          'jobsCreated' := JobsCreated,
          'batchJobsPerSeed' := BatchJobsPerSeed,
          'invocationsPerBatchJob' := InvocationsPerBatchJob,
          'seedJobDefinitionId' := SeedJobDefinitionId,
          'monitorJobDefinitionId' := MonitorJobDefinitionId,
          'batchJobDefinitionId' := BatchJobDefinitionId,
          'suspended' := Suspended,
          'tenantId' := TenantId,
          'createUserId' := CreateUserId
        }) ->
    #{ 'id' => Id,
       'type' => Type,
       'totalJobs' => TotalJobs,
       'jobsCreated' => JobsCreated,
       'batchJobsPerSeed' => BatchJobsPerSeed,
       'invocationsPerBatchJob' => InvocationsPerBatchJob,
       'seedJobDefinitionId' => SeedJobDefinitionId,
       'monitorJobDefinitionId' => MonitorJobDefinitionId,
       'batchJobDefinitionId' => BatchJobDefinitionId,
       'suspended' => Suspended,
       'tenantId' => TenantId,
       'createUserId' => CreateUserId
     }.
