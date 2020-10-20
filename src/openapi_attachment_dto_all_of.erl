-module(openapi_attachment_dto_all_of).

-export([encode/1]).

-export_type([openapi_attachment_dto_all_of/0]).

-type openapi_attachment_dto_all_of() ::
    #{ 'id' => binary(),
       'name' => binary(),
       'description' => binary(),
       'taskId' => binary(),
       'type' => binary(),
       'url' => binary(),
       'createTime' => openapi_date_time:openapi_date_time(),
       'removalTime' => openapi_date_time:openapi_date_time(),
       'rootProcessInstanceId' => binary()
     }.

encode(#{ 'id' := Id,
          'name' := Name,
          'description' := Description,
          'taskId' := TaskId,
          'type' := Type,
          'url' := Url,
          'createTime' := CreateTime,
          'removalTime' := RemovalTime,
          'rootProcessInstanceId' := RootProcessInstanceId
        }) ->
    #{ 'id' => Id,
       'name' => Name,
       'description' => Description,
       'taskId' => TaskId,
       'type' => Type,
       'url' => Url,
       'createTime' => CreateTime,
       'removalTime' => RemovalTime,
       'rootProcessInstanceId' => RootProcessInstanceId
     }.
