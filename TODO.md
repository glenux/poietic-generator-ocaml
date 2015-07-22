<!-- vim: set ts=2 sw=2 et: -->

## Create a module for managing ressource, routes & controlers

## Find a way to declare subressource in a rails way.

Example (in Ruby)

    ressource "/foo", FooControler do |foo| 
      ressource "/bar", BarControler
    end


Resulting routes :

    GET /foo/
    GET /foo/new
    POST /foo
    GET /foo/:id/edit
    ...
    GET /foo/:id/bar/
    GET /foo/:id/bar/new
    POST /foo/:id/bar
    GET /foo/:id/bar/:id/edit
    ...

    => /foo/:id/bar/:id


Suggestion (in Ocaml) :

    Ressource.build "/foo", foo_controler, [
      Ressource.build "/bar", bar_controler
    ] 
    |> Ressource.wrap


But we miss the |foo| parameter. Is it usefull ? 

