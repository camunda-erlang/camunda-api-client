-module(openapi_schema_log_entry_dto).

-export([encode/1]).

-export_type([openapi_schema_log_entry_dto/0]).

-type openapi_schema_log_entry_dto() ::
    #{ 'id' => binary(),
       'timestamp' => openapi_date_time:openapi_date_time(),
       'version' => binary()
     }.

encode(#{ 'id' := Id,
          'timestamp' := Timestamp,
          'version' := Version
        }) ->
    #{ 'id' => Id,
       'timestamp' => Timestamp,
       'version' => Version
     }.
