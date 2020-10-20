-module(openapi_multi_form_attachment_dto).

-export([encode/1]).

-export_type([openapi_multi_form_attachment_dto/0]).

-type openapi_multi_form_attachment_dto() ::
    #{ 'attachment_name' => binary(),
       'attachment_description' => binary(),
       'attachment_type' => binary(),
       'url' => binary(),
       'content' => binary()
     }.

encode(#{ 'attachment_name' := AttachmentName,
          'attachment_description' := AttachmentDescription,
          'attachment_type' := AttachmentType,
          'url' := Url,
          'content' := Content
        }) ->
    #{ 'attachment-name' => AttachmentName,
       'attachment-description' => AttachmentDescription,
       'attachment-type' => AttachmentType,
       'url' => Url,
       'content' => Content
     }.
