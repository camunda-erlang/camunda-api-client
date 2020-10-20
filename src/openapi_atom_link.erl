-module(openapi_atom_link).

-export([encode/1]).

-export_type([openapi_atom_link/0]).

-type openapi_atom_link() ::
    #{ 'rel' => binary(),
       'href' => binary(),
       'method' => binary()
     }.

encode(#{ 'rel' := Rel,
          'href' := Href,
          'method' := Method
        }) ->
    #{ 'rel' => Rel,
       'href' => Href,
       'method' => Method
     }.
