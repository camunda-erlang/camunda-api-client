-module(openapi_comment_dto_all_of).

-export([encode/1]).

-export_type([openapi_comment_dto_all_of/0]).

-type openapi_comment_dto_all_of() ::
    #{ 'id' => binary(),
       'userId' => binary(),
       'taskId' => binary(),
       'time' => openapi_date_time:openapi_date_time(),
       'message' => binary(),
       'removalTime' => openapi_date_time:openapi_date_time(),
       'rootProcessInstanceId' => binary()
     }.

encode(#{ 'id' := Id,
          'userId' := UserId,
          'taskId' := TaskId,
          'time' := Time,
          'message' := Message,
          'removalTime' := RemovalTime,
          'rootProcessInstanceId' := RootProcessInstanceId
        }) ->
    #{ 'id' => Id,
       'userId' => UserId,
       'taskId' => TaskId,
       'time' => Time,
       'message' => Message,
       'removalTime' => RemovalTime,
       'rootProcessInstanceId' => RootProcessInstanceId
     }.
