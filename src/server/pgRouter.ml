open Core_kernel.Std
open Opium.Std

let ressource_struct prefix_uri controler req = begin
  let url_index   = prefix_uri
  and url_new     = prefix_uri ^ "/new"
  and url_create  = prefix_uri
  and url_show    = prefix_uri ^ "/:id"
  and url_edit    = prefix_uri ^ "/:id/edit"
  and url_update  = prefix_uri ^ "/:id"
  and url_destroy = prefix_uri ^ "/:id"
  in
  let route_for_index   = get    url_index   controler.action_index
  and route_for_new     = get    url_new     controler.action_new
  and route_for_create  = post   url_create  controler.action_create
  and route_for_show    = get    url_show    controler.action_show

  and route_for_edit    = get    url_edit    controler.action_edit
  and route_for_update  = put    url_update  controler.action_update
  and route_for_destroy = delete url_destroy controler.action_destroy
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

let ressource_obj prefix_uri controler req = begin
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
