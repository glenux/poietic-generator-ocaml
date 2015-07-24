
open Core_kernel.Std
open Opium.Std

type 'a ;;

type controler_struct_t = {
    action_index : controler_handle_t ;
    action_new : controler_handle_t ;
    action_create : controler_handle_t ;
}

let patoumo_index = begin fun req ->
  (`String ("patoumo#index") |> respond')
end

let patoumo_new = begin fun req -> 
  (`String ("patoumo#new") |> respond')
end

let patoumo_create = begin fun req ->
  (`String ("patoumo#create") |> respond')
end

let patoumo_show = begin fun req ->
  (`String ("patoumo#show" ^ param req "id" ) |> respond')
end

let patoumo_edit = begin fun req -> 
  (`String ("patoumo#edit" ^ param req "id" ) |> respond')
end

let patoumo_update = begin fun req ->
  (`String ("patoumo#update" ^ param req "id") |> respond')
end

let patoumo_destroy = begin fun req ->
  (`String ("patoumo#destroy" ^ param req "id") |> respond')
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

let patoumo_obj_controler = 
  object (self) 
    method action_index = begin fun req ->
      (`String ("patoumo#index") |> respond')
    end
    method action_new = begin fun req -> 
      (`String ("patoumo#new") |> respond')
    end
    method action_create = begin fun req ->
      (`String ("patoumo#create") |> respond')
    end
    method action_show = begin fun req ->
      (`String ("patoumo#show" ^ param req "id" ) |> respond')
    end
    method action_edit = begin fun req -> 
      (`String ("patoumo#edit" ^ param req "id" ) |> respond')
    end
    method action_update = begin fun req ->
      (`String ("patoumo#update" ^ param req "id") |> respond')
    end
    method action_destroy = begin fun req ->
      (`String ("patoumo#destroy" ^ param req "id") |> respond')
    end
  end


(* 
 * FIXME: serve templates files (with jingoo)
 * FIXME: prepare database (with ORM ?)
 * FIXME: implement admin base (create, delete, etc.)
 * FIXME: load configuration at startup from INI file
 * *)
let _ =
  let static = begin
    Middleware.static ~local_path:"./views" 
      ~uri_prefix:"/views" 
  end
  in
  App.empty
  |> middleware static
  |> PgRouter.ressource_obj "/group" patoumo_controler
  |> PgRouter.ressource_obj "/group/:id/session" patoumo_controler
  |> PgRouter.ressource_obj "/admin/:id/session" patoumo_controler
  |> App.run_command

