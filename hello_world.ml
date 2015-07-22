open Core_kernel.Std
open Opium.Std

type person = {
  name: string;
  age: int;
}

let json_of_person { name ; age } =
  let open Ezjsonm in
  dict [ "name", (string name)
       ; "age", (int age) ]

(*
let print_param = put "/hello/:name" begin fun req ->
    `String ("Hello " ^ param req "name") |>respond'
  end

let print_person = get "/person/:name/:age" begin fun req ->
    let person = {
      name = param req "name";
      age = "age" |> param req |> Int.of_string;
    } in
    `Json (person |> json_of_person |> Ezjsonm.wrap) |> respond'
  end
*)


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

let ressource relative_url req = begin
  let url_index = relative_url
  and url_new = relative_url ^ "/new"
  and url_create = relative_url
  and url_show = relative_url ^ "/:id"
  and url_edit = relative_url ^ "/:id/edit"
  and url_update = relative_url ^ "/:id"
  and url_destroy = relative_url ^ "/:id"
  in
  let route_for_index = get url_index patoumo_controler#action_index
  and route_for_new = get url_new patoumo_controler#action_new
  and route_for_create = post url_create patoumo_controler#action_create
  and route_for_show = get url_show patoumo_controler#action_show
 
  and route_for_edit = get url_edit patoumo_controler#action_edit
  and route_for_update = put url_update patoumo_controler#action_update
  and route_for_destroy = delete url_destroy patoumo_controler#action_destroy
  in
  req 
  |> route_for_index
  (*
  |> route_for_new
  |> route_for_create
  |> route_for_show
  |> route_for_edit
  |> route_for_update
  |> route_for_destroy
  *)
end

let _ =
  App.empty
  |> ressource "/patoumos"
  |> App.run_command

