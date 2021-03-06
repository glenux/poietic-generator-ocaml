
open Core_kernel.Std
open Opium.Std

let handle_v1 = begin fun ressource_name -> 
  begin fun req ->
    let handle_get = get ressource_name begin fun req ->
        (`String ("Hello" ^ param req "name") |> respond')
      end
    and handle_put = put ressource_name begin fun req ->
        (`String ("Hello" ^ param req "name") |> respond')
      end
    in
    req |> handle_get |> handle_put
  end
end


let patoumo_controler = 
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

let action_index = begin fun req ->
  `String ("patoumo#index") |> respond'
end 

let ressource prefix_uri controler req = begin
  let url_index   = prefix_uri
  and url_new     = prefix_uri ^ "/new"
  and url_create  = prefix_uri
  and url_show    = prefix_uri ^ "/:id"
  and url_edit    = prefix_uri ^ "/:id/edit"
  and url_update  = prefix_uri ^ "/:id"
  and url_destroy = prefix_uri ^ "/:id"
  in
  let route_for_index   = get    url_index   controler#action_index
  and route_for_new     = get    url_new     controler#action_new
  and route_for_create  = post   url_create  controler#action_create
  and route_for_show    = get    url_show    controler#action_show

  and route_for_edit    = get    url_edit    controler#action_edit
  and route_for_update  = put    url_update  controler#action_update
  and route_for_destroy = delete url_destroy controler#action_destroy
  in
  req 
  |> route_for_index
  |> route_for_new
  |> route_for_create
  |> route_for_show
  |> route_for_edit
  |> route_for_update
  |> route_for_destroy
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
  |> ressource "/group" patoumo_controler
  |> ressource "/group/:id/session" patoumo_controler
  |> ressource "/admin/:id/session" patoumo_controler
  |> App.run_command

