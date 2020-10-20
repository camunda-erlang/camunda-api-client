-module(openapi_comment_dto).

-export([encode/1]).

-export_type([openapi_comment_dto/0]).

-type openapi_comment_dto() ::
    #{ 'id' => binary(),
       'userId' => binary(),
       'taskId' => binary(),
       'time' => openapi_date_time:openapi_date_time(),
       'message' => binary(),
       'removalTime' => openapi_date_time:openapi_date_time(),
       'rootProcessInstanceId' => binary(),
       'links' => list()
     }.

encode(#{ 'id' := Id,
          'userId' := UserId,
          'taskId' := TaskId,
          'time' := Time,
          'message' := Message,
          'removalTime' := RemovalTime,
          'rootProcessInstanceId' := RootProcessInstanceId,
          'links' := Links
        }) ->
    #{ 'id' => Id,
       'userId' => UserId,
       'taskId' => TaskId,
       'time' => Time,
       'message' => Message,
       'removalTime' => RemovalTime,
       'rootProcessInstanceId' => RootProcessInstanceId,
       'links' => Links
     }.
