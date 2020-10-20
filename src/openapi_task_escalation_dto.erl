-module(openapi_task_escalation_dto).

-export([encode/1]).

-export_type([openapi_task_escalation_dto/0]).

-type openapi_task_escalation_dto() ::
    #{ 'escalationCode' => binary(),
       'variables' => maps:map()
     }.

encode(#{ 'escalationCode' := EscalationCode,
          'variables' := Variables
        }) ->
    #{ 'escalationCode' => EscalationCode,
       'variables' => Variables
     }.
