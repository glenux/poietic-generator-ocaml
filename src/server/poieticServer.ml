
open Core_kernel.Std
open Opium.Std
open PgRoute

let patoumo_index = begin fun req ->
  `String ("patoumo#index") |> respond'
end

let patoumo_new = begin fun req -> 
  `String ("patoumo#new") |> respond'
end

let patoumo_create = begin fun req ->
  `String ("patoumo#create") |> respond'
end

let patoumo_show = begin fun req ->
  `String ("patoumo#show" ^ param req "id" ) |> respond'
end

let patoumo_edit = begin fun req -> 
  `String ("patoumo#edit" ^ param req "id" ) |> respond'
end

let patoumo_update = begin fun req ->
  `String ("patoumo#update" ^ param req "id") |> respond'
end

let patoumo_destroy = begin fun req ->
  `String ("patoumo#destroy" ^ param req "id") |> respond'
end

let patoumo_controler_struct = {
  action_index = patoumo_index ;
  action_new = patoumo_new ;
  action_create = patoumo_create ;
  action_show =  patoumo_show ;
  action_edit = patoumo_edit ;
  action_update = patoumo_update ;
  action_destroy = patoumo_destroy ;
}


(* 
 * FIXME: serve templates files (with jingoo)
 * FIXME: prepare database (with ORM ?)
 * FIXME: implement admin base (create, delete, etc.)
 * FIXME: load configuration at startup from INI file
 *)
let _ =
  let static = begin
    Middleware.static ~local_path:"./views" 
      ~uri_prefix:"/views" 
  end
  in
  App.empty
  |> middleware static
  |> PgRoute.ressource "/group" patoumo_controler_struct
  |> PgRoute.ressource "/group/:id/session" patoumo_controler_struct
  |> PgRoute.ressource "/admin/:id/session" patoumo_controler_struct
  |> App.run_command

