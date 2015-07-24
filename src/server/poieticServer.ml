
open Core_kernel.Std
open Opium.Std
open PgRoute


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
  |> PgRoute.ressource "/group" PgTestControler.controler_struct
  (* |> PgRoute.ressource "/group/:id/session" patoumo_controler_struct *)
  (* |> PgRoute.ressource "/admin/:id/session" patoumo_controler_struct *)
  |> App.run_command

