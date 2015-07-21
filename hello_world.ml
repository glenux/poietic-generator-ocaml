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

(*
let handle_ressource = begin fun ressource_name ->
    begin fun req ->
        let handle_get = get "/hello/:name" begin fun req ->
            `String ("Get " ^ param req "name") |> respond'
end
        and handle_put = put "/hello/:name" begin fun req ->
            `String ("Put " ^ param req "name") |> respond'
        end
    in 
    ( handle_get |> handle_put )
        end
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
      req |> handle_put |> handle_put
  end
end

let _ =
  App.empty
  |> ( fun req -> req |> print_param |> print_person)
  |> (handle_v1 "/patoumo")
  |> App.run_command

