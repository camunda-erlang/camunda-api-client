-module(openapi_fetch_external_tasks_dto).

-export([encode/1]).

-export_type([openapi_fetch_external_tasks_dto/0]).

-type openapi_fetch_external_tasks_dto() ::
    #{ 'workerId' := binary(),
       'maxTasks' := integer(),
       'usePriority' => boolean(),
       'asyncResponseTimeout' => integer(),
       'topics' => list()
     }.

encode(#{ 'workerId' := WorkerId,
          'maxTasks' := MaxTasks,
          'usePriority' := UsePriority,
          'asyncResponseTimeout' := AsyncResponseTimeout,
          'topics' := Topics
        }) ->
    #{ 'workerId' => WorkerId,
       'maxTasks' => MaxTasks,
       'usePriority' => UsePriority,
       'asyncResponseTimeout' => AsyncResponseTimeout,
       'topics' => Topics
     }.
